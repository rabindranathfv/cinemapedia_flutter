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

| Source name                                | Generated provider                         |
| ------------------------------------------ | ------------------------------------------ |
| `quoteTemplatesRepository` (function)      | `quoteTemplatesRepositoryProvider`         |
| `MarketNotifier` (class)                   | `marketNotifierProvider`                   |
| `recommendedQuotations` (function + param) | `recommendedQuotationsProvider(companyId)` |

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

**File:** `lib/src/core/providers/quote_templates_repository.dart`

```dart
import 'package:my_app/src/core/providers/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/impl.dart' show FirestoreQuoteTemplatesRepository;
import 'package:core/core.dart' show QuoteTemplatesRepository;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_templates_repository.g.dart';

@riverpod
QuoteTemplatesRepository quoteTemplatesRepository(Ref ref) {
  return FirestoreQuoteTemplatesRepository(
    firestore: ref.read(firestoreProvider),
  );
}
```

### Key points

- **`@riverpod`** (lowercase) — auto-disposed when no longer watched.
- **`ref.read()`** — reads another provider once without subscribing. Use for dependencies that won't change.
- **`ref.watch()`** — subscribes to changes. Use when the provider should rebuild if the dependency changes.

### Consuming in a widget

```dart
final repo = ref.watch(quoteTemplatesRepositoryProvider);
```

---

## Example 2: AsyncNotifier with `keepAlive` (Persistent State)

A class-based provider for async state that survives widget disposal.

**File:** `lib/src/core/providers/market_notifier.dart`

```dart
import 'package:my_app/src/core/providers/market_provider.dart';
import 'package:my_app/src/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'market_notifier.g.dart';

const kMarketIdKey = 'app_market_code';

@Riverpod(keepAlive: true)
class MarketNotifier extends _$MarketNotifier {
  @override
  FutureOr<AppMarket?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(kMarketIdKey);
    return _findMarketByCode(code);
  }

  Future<AppMarket?> _findMarketByCode(String? code) async {
    final result = await ref.read(getMarketsProvider.future);
    return switch (result) {
      Success(:final value) =>
        value.firstWhereOrNull((m) => m.code == code),
      Failure() => null,
    };
  }

  Future<void> setMarket(AppMarket market) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kMarketIdKey, market.code);
    state = AsyncValue.data(market);
  }
}
```

### Key points

- **`@Riverpod(keepAlive: true)`** (uppercase `R`) — the provider stays alive in memory forever. Use for global state (auth, market, locale).
- **`build()` method** — initializes the state. Equivalent to `FutureProvider` but with mutation methods.
- **`state = AsyncValue.data(value)`** — how you update state from methods.
- **`extends _$MarketNotifier`** — the generated base class. Always `_$` + class name.

### Consuming in a widget

```dart
// Watch the async state
final marketAsync = ref.watch(marketNotifierProvider);

// Call a method
ref.read(marketNotifierProvider.notifier).setMarket(selectedMarket);
```

---

## Example 3: Provider Family with Cache Expiry (Parameterized)

A function-based provider that takes parameters and manages its own cache lifetime.

**File:** `lib/src/features/producer/data/matchmaking_provider.dart`

```dart
import 'dart:async';

import 'package:my_app/src/core/providers/firebase_service.dart';
import 'package:my_app/src/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matchmaking_provider.g.dart';

@riverpod
MatchmakingRepository matchmakingRepository(Ref ref) {
  final firestore = ref.read(firestoreProvider);
  return FirestoreMatchmakingRepository(firestore: firestore);
}

@riverpod
Future<List<String>> recommendedQuotations(
  Ref ref,
  String companyId,
) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 5), link.close);
  ref.onDispose(timer.cancel);

  final result = await ref
      .watch(matchmakingRepositoryProvider)
      .getRecommendedQuotations(companyId);
  return switch (result) {
    Success(:final value) => value,
    Failure(:final error) => () {
      Logger.log('Failed to fetch recommendations for $companyId: $error');
      return const <String>[];
    }(),
  };
}
```

### Key points

- **Parameters** — any parameter after `Ref ref` turns the provider into a **family**. The generated provider is called with the argument: `recommendedQuotationsProvider(companyId)`.
- **`ref.keepAlive()`** — prevents auto-disposal. Returns a `KeepAliveLink` that you can `.close()` later.
- **`ref.onDispose()`** — cleanup callback. Cancel timers, close streams, release resources.
- **Cache pattern** — keep alive + timer = cached for 5 minutes, then auto-disposed.

### Consuming in a widget

```dart
final quotationsAsync = ref.watch(recommendedQuotationsProvider(companyId));
```

---

## Example 4: StreamProvider with Multiple Parameters

A realtime stream provider that watches Firestore for changes.

**File:** `lib/src/features/quotation/data/bids_repository_provider.dart`

```dart
import 'package:my_app/src/core/providers/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bids_repository_provider.g.dart';

@Riverpod(keepAlive: true)
BidsRepository bidsRepository(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return FirestoreBidsRepository(firestore: firestore);
}

@Riverpod(keepAlive: true)
Stream<AppBid?> activeBid(
  Ref ref,
  String companyId,
  String consumerId,
  String quotationId,
) {
  final bidsRepo = ref.watch(bidsRepositoryProvider);
  return bidsRepo
      .activeBidStream(
        companyId: companyId,
        consumerId: consumerId,
        quotationId: quotationId,
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
- **Multiple parameters** — all come after `Ref ref`. Consumed as: `activeBidProvider(companyId, consumerId, quotationId)`.
- **`ref.watch(bidsRepositoryProvider)`** — subscribes to the repository. If it rebuilds, the stream restarts.

---

## Example 5: Complex AsyncNotifier with Debouncing and Polling

A full-featured notifier managing batch operations with internal timers.

**File:** `lib/src/features/notifications/data/producer_notifications_notifier.dart`

```dart
import 'dart:async';

import 'package:my_app/src/core/utils/constants.dart';
import 'package:my_app/src/core/utils/logger.dart';
import 'package:my_app/src/features/notifications/data/notifications_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'producer_notifications_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProducerNotificationsNotifier extends _$ProducerNotificationsNotifier {
  Timer? _debounceTimer;
  Timer? _pollingTimer;
  String? _currentUid;
  List<String> _currentEntityIds = [];

  @override
  Map<String, String?> build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
      _pollingTimer?.cancel();
    });
    return {};
  }

  void requestNotifications(String uid, List<String> entityIds) {
    _currentUid = uid;
    _currentEntityIds = entityIds;

    if (entityIds.isEmpty) {
      _pollingTimer?.cancel();
      state = {};
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(
      const Duration(milliseconds: 250),
      () => _fetchBatch(uid, entityIds),
    );
  }

  Future<void> _fetchBatch(String uid, List<String> entityIds) async {
    final notifications = await ref
        .read(notificationsRepositoryProvider)
        .notificationsByEntities(uid, entityIds);

    final notificationMap = {
      for (final n in notifications ?? []) n.entityId: n.id,
    };
    state = {
      for (final entityId in entityIds)
        entityId: notificationMap[entityId],
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
ref.read(producerNotificationsNotifierProvider.notifier)
    .requestNotifications(uid, entityIds);

// Watch a specific entity's notification (selective rebuild)
final notificationId = ref.watch(
  producerNotificationsNotifierProvider.select((map) => map[quotationId]),
);
```

---

## Handling AsyncValue in Widgets

### Option A: `AsyncValueWidget` (preferred)

A reusable widget for standard loading/error/data handling:

```dart
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
AsyncValueWidget<AppMarket?>(
  value: ref.watch(marketNotifierProvider),
  showLoading: true,
  onData: (market) => Text(market?.name ?? 'No market'),
)
```

### Option B: `.when()` inline

For one-off cases or when you need custom loading/error:

```dart
ref.watch(marketNotifierProvider).when(
  data: (market) => Text(market?.name ?? ''),
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
// ✅ Watch in build — widget rebuilds when market changes
final market = ref.watch(marketNotifierProvider);

// ✅ Read in callbacks — one-shot action
onPressed: () => ref.read(marketNotifierProvider.notifier).setMarket(market),

// ✅ Listen for side effects — navigate on error
ref.listen(marketNotifierProvider, (prev, next) {
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
