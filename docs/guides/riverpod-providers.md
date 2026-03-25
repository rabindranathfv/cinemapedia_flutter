# State Management with Riverpod

This guide covers how to create and consume providers using [Riverpod](https://riverpod.dev/) with code generation (`@riverpod`) in a Flutter project codebase.

## Required Dependencies

### Runtime dependency (in `pubspec.yaml`)

```yaml
dependencies:
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1
```

### Dev dependencies (for code generation)

```yaml
dev_dependencies:
  build_runner: ^2.13.1
  riverpod_generator: ^4.0.3.6.3
```

> In a monorepo setup these are typically already configured. You typically only need `flutter_riverpod` and `riverpod_annotation` as direct dependencies.

## Code Generation Commands

After creating or modifying a provider:

```bash
# From the project root
make generate

# Or directly with FVM
cd my_app && fvm dart run build_runner build --delete-conflicting-outputs
```

> **Never edit generated files** (`*.g.dart`) manually.

## File Structure

Every provider file follows this pattern:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_provider.g.dart';  // Generated: provider definition

@riverpod
MyType myProvider(Ref ref) {
  // ...
}
```

The `part` directive is mandatory — the `.g.dart` file contains the generated provider variable (e.g., `myProviderProvider`).

## Provider Naming Convention

The generated provider name appends `Provider` to the function/class name:

| Source name                             | Generated provider                       |
| --------------------------------------- | ---------------------------------------- |
| `productsRepository` (function)         | `productsRepositoryProvider`             |
| `LocaleNotifier` (class)                | `localeNotifierProvider`                 |
| `productsByCategory` (function + param) | `productsByCategoryProvider(categoryId)` |

---

## Provider Types at a Glance

| Pattern                                  | Use case                      | Lifecycle      |
| ---------------------------------------- | ----------------------------- | -------------- |
| Function returning `T`                   | Repository, service, use case | Auto-disposed  |
| Function returning `Future<T>`           | One-shot async fetch          | Auto-disposed  |
| Function returning `Stream<T>`           | Realtime Firestore data       | Auto-disposed  |
| Class extending `_$Name` (Notifier)      | Synchronous mutable state     | Auto-disposed  |
| Class extending `_$Name` (AsyncNotifier) | Async mutable state           | Auto-disposed  |
| `@Riverpod(keepAlive: true)`             | Global/persistent state       | Never disposed |

---

## Example 1: Simple Repository Provider (Function-based)

The most common pattern — a function that returns a repository instance.

**File:** `lib/src/core/providers/products_repository_provider.dart`

```dart
import 'package:my_app/src/core/providers/http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/features/products/data/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository_provider.g.dart';

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return HttpProductsRepository(
    client: ref.read(httpClientProvider),
  );
}
```

### Key points

- **`@riverpod`** (lowercase) — auto-disposed when no longer watched.
- **`ref.read()`** — reads another provider once without subscribing. Use for dependencies that won't change.
- **`ref.watch()`** — subscribes to changes. Use when the provider should rebuild if the dependency changes.

### Consuming in a widget

```dart
final repo = ref.watch(productsRepositoryProvider);
```

---

## Example 2: AsyncNotifier with `keepAlive` (Persistent State)

A class-based provider for async state that survives widget disposal.

**File:** `lib/src/core/providers/locale_notifier.dart`

```dart
import 'package:my_app/src/core/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_notifier.g.dart';

const kLocaleKey = 'app_locale_code';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  FutureOr<Locale?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(kLocaleKey);
    return code != null ? Locale(code) : null;
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kLocaleKey, locale.languageCode);
    state = AsyncValue.data(locale);
  }
}
```

### Key points

- **`@Riverpod(keepAlive: true)`** (uppercase `R`) — the provider stays alive in memory forever. Use for global state (auth, locale, theme).
- **`build()` method** — initializes the state. Equivalent to `FutureProvider` but with mutation methods.
- **`state = AsyncValue.data(value)`** — how you update state from methods.
- **`extends _$LocaleNotifier`** — the generated base class. Always `_$` + class name.

### Consuming in a widget

```dart
// Watch the async state
final localeAsync = ref.watch(localeNotifierProvider);

// Call a method
ref.read(localeNotifierProvider.notifier).setLocale(selectedLocale);
```

---

## Example 3: Provider Family with Cache Expiry (Parameterized)

A function-based provider that takes parameters and manages its own cache lifetime.

**File:** `lib/src/features/products/data/products_provider.dart`

```dart
import 'dart:async';

import 'package:my_app/src/core/providers/http_client_provider.dart';
import 'package:my_app/src/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/features/products/data/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductsRepository productsRepository(Ref ref) {
  final client = ref.read(httpClientProvider);
  return HttpProductsRepository(client: client);
}

@riverpod
Future<List<Product>> productsByCategory(
  Ref ref,
  String categoryId,
) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 5), link.close);
  ref.onDispose(timer.cancel);

  final result = await ref
      .watch(productsRepositoryProvider)
      .getByCategory(categoryId);
  return switch (result) {
    Success(:final value) => value,
    Failure(:final error) => () {
      Logger.log('Failed to fetch products for $categoryId: $error');
      return const <Product>[];
    }(),
  };
}
```

### Key points

- **Parameters** — any parameter after `Ref ref` turns the provider into a **family**. The generated provider is called with the argument: `productsByCategoryProvider(categoryId)`.
- **`ref.keepAlive()`** — prevents auto-disposal. Returns a `KeepAliveLink` that you can `.close()` later.
- **`ref.onDispose()`** — cleanup callback. Cancel timers, close streams, release resources.
- **Cache pattern** — keep alive + timer = cached for 5 minutes, then auto-disposed.

### Consuming in a widget

```dart
final productsAsync = ref.watch(productsByCategoryProvider(categoryId));
```

---

## Example 4: StreamProvider with Multiple Parameters

A realtime stream provider that watches a remote source for changes.

**File:** `lib/src/features/comments/data/comments_provider.dart`

```dart
import 'package:my_app/src/core/providers/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/features/comments/data/comments_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_provider.g.dart';

@Riverpod(keepAlive: true)
CommentsRepository commentsRepository(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirestoreCommentsRepository(firestore: firestore);
}

@Riverpod(keepAlive: true)
Stream<List<Comment>> postComments(
  Ref ref,
  String userId,
  String postId,
) {
  final commentsRepo = ref.watch(commentsRepositoryProvider);
  return commentsRepo
      .commentsStream(
        userId: userId,
        postId: postId,
      )
      .map(
        (result) => switch (result) {
          Success(:final value) => value,
          Failure(:final error) => throw Exception(error.message),
        },
      );
}
```

### Key points

- **Return `Stream<T>`** — Riverpod automatically converts it to `AsyncValue<T>` for widgets.
- **Multiple parameters** — all come after `Ref ref`. Consumed as: `postCommentsProvider(userId, postId)`.
- **`ref.watch(commentsRepositoryProvider)`** — subscribes to the repository. If it rebuilds, the stream restarts.

---

## Example 5: Complex AsyncNotifier with Debouncing and Polling

A full-featured notifier managing batch operations with internal timers.

**File:** `lib/src/features/notifications/data/push_notifications_notifier.dart`

```dart
import 'dart:async';

import 'package:my_app/src/core/utils/constants.dart';
import 'package:my_app/src/core/utils/logger.dart';
import 'package:my_app/src/features/notifications/data/notifications_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notifications_notifier.g.dart';

@Riverpod(keepAlive: true)
class PushNotificationsNotifier extends _$PushNotificationsNotifier {
  Timer? _debounceTimer;
  Timer? _pollingTimer;
  String? _currentUserId;
  List<String> _currentItemIds = [];

  @override
  Map<String, String?> build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
      _pollingTimer?.cancel();
    });
    return {};
  }

  void requestNotifications(String userId, List<String> itemIds) {
    _currentUserId = userId;
    _currentItemIds = itemIds;

    if (itemIds.isEmpty) {
      _pollingTimer?.cancel();
      state = {};
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      const Duration(milliseconds: 250),
      () => _fetchBatch(userId, itemIds),
    );
  }

  Future<void> _fetchBatch(String userId, List<String> itemIds) async {
    final notifications = await ref
        .read(notificationsRepositoryProvider)
        .notificationsByItems(userId, itemIds);

    final notificationMap = {
      for (final n in notifications ?? []) n.itemId: n.id,
    };
    state = {
      for (final itemId in itemIds)
        itemId: notificationMap[itemId],
    };
  }
}
```

### Key points

- **Synchronous `build()`** — returns `Map<String, String?>` (not a `Future`). This is a regular `Notifier`, not an `AsyncNotifier`.
- **Private instance fields** — timers, debounce state. These persist as long as the provider is alive.
- **`ref.onDispose()`** — clean up timers when the provider is disposed.
- **`state = newValue`** — direct state assignment for synchronous notifiers.

### Consuming in a widget

```dart
// Request batch notifications
ref.read(pushNotificationsNotifierProvider.notifier)
    .requestNotifications(userId, itemIds);

// Watch a specific item's notification (selective rebuild)
final notificationId = ref.watch(
  pushNotificationsNotifierProvider.select((map) => map[itemId]),
);
```

---

## Handling AsyncValue in Widgets

### Option A: `AsyncValueWidget` (preferred)

A reusable widget for standard loading/error/data handling:

```dart
import 'package:cinemapedia_flutter/presentation/screen/providers/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.onData,
    this.showLoading = false,
  });

  final AsyncValue<T> value;
  final Widget Function(T) onData;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: onData,
      error: (error, stackTrace) {
        Logger.log('Error loading data: $error', stackTrace: stackTrace);
        return Center(child: ErrorMessageWidget(error.toString()));
      },
      loading: () => showLoading
          ? const Center(child: AppCircularProgressIndicator())
          : const SizedBox.shrink(),
    );
  }
}
```

**Usage:**

```dart
AsyncValueWidget<Locale?>(
  value: ref.watch(localeNotifierProvider),
  showLoading: true,
  onData: (locale) => Text(locale?.languageCode ?? 'System default'),
)
```

### Option B: `.when()` inline

For one-off cases or when you need custom loading/error:

```dart
ref.watch(localeNotifierProvider).when(
  data: (locale) => Text(locale?.languageCode ?? ''),
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
)
```

### Option C: `AsyncValue.guard()` in notifiers

For error-safe state updates:

```dart
Future<void> refresh() async {
  state = const AsyncValue.loading();
  state = await AsyncValue.guard(() => _loadData());
}
```

---

## Widget Types for Consuming Providers

| Widget type              | Use when                                       |
| ------------------------ | ---------------------------------------------- |
| `ConsumerWidget`         | Stateless widget that needs `ref`              |
| `ConsumerStatefulWidget` | Stateful widget that needs `ref`               |
| `Consumer`               | Inline builder when only a subtree needs `ref` |

### ConsumerWidget

```dart
class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(myProvider);
    return Text(data);
  }
}
```

### ConsumerStatefulWidget

```dart
class MyScreen extends ConsumerStatefulWidget {
  const MyScreen({super.key});

  @override
  ConsumerState<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends ConsumerState<MyScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(myProvider);
    return Text(data);
  }
}
```

---

## Quick Reference: `ref.watch` vs `ref.read` vs `ref.listen`

| Method         | Rebuilds on change? | Use in `build()`? | Use case                                    |
| -------------- | ------------------- | ----------------- | ------------------------------------------- |
| `ref.watch()`  | Yes                 | Yes               | Reactive UI binding                         |
| `ref.read()`   | No                  | Avoid             | One-shot reads, event handlers, `onPressed` |
| `ref.listen()` | Side-effect only    | Yes               | Show snackbar, navigate on state change     |

### Rules of thumb

```dart
// ✅ Watch in build — widget rebuilds when locale changes
final locale = ref.watch(localeNotifierProvider);

// ✅ Read in callbacks — one-shot action
onPressed: () => ref.read(localeNotifierProvider.notifier).setLocale(selectedLocale),

// ✅ Listen for side effects — navigate on error
ref.listen(localeNotifierProvider, (prev, next) {
  if (next.hasError) showErrorSnackbar(context, next.error!);
});

// ❌ Don't watch in callbacks
onPressed: () => ref.watch(provider); // WRONG
```

## Common Mistakes

| Mistake                                 | Fix                                                              |
| --------------------------------------- | ---------------------------------------------------------------- |
| Using `ref.watch()` inside `onPressed`  | Use `ref.read()` for event handlers                              |
| Editing `*.g.dart` files                | Run `make generate` instead                                      |
| Missing `part 'file.g.dart';`           | Add the `part` directive at the top                              |
| Forgetting `keepAlive` for global state | Add `@Riverpod(keepAlive: true)`                                 |
| Not cleaning up timers/streams          | Use `ref.onDispose()` in the `build()` method                    |
| Using `.select()` without a clear need  | Only use `.select()` to optimize rebuilds on large state objects |
