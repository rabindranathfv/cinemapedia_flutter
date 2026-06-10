# Patrol E2E Testing — Implementation Plan

> **Created:** 2026-06-10 | **Status:** 🔲 NOT STARTED
> **Framework:** [Patrol](https://patrol.leancode.co/) by LeanCode
> **References:** [Patrol docs](https://patrol.leancode.co/) · [Patrol‑Driven UI Test Architecture for Flutter (V. Bacık)](https://vbacik-10.medium.com/patrol-driven-ui-test-architecture-for-flutter-2e92923cfa49)

## Summary

This plan introduces **Patrol** — a Flutter-first E2E UI testing framework — to the project. Patrol builds on Flutter's `integration_test` plugin and adds three capabilities the default tooling lacks:

1. **Native interaction** — permission dialogs, notifications, Wi-Fi/cellular toggles, dark mode, device settings, screenshots, home button.
2. **A concise custom finder system** (`$`) — shorter, more readable than raw `WidgetTester`.
3. **A powerful CLI** (`patrol_cli`) — building, running, hot-restart (`patrol develop`), test isolation, and device-farm integration.

The plan is split into two parts:

- **Part A — Reusable Patrol Playbook** (`G1`–`G6`): project-agnostic tasks that apply to **any** Flutter project. Copy this section into other repos as a starting checklist.
- **Part B — Cinemapedia-Specific Slices** (`S1`–`S9`): the concrete work to test this app's features (home, movie detail, search, categories, favorites).

The test architecture follows a **Page Object + Chain-of-Responsibility "Flow"** design (from the reference article): centralized `Keys`, per-feature page objects, and composable scenario flows that can be chained into full user journeys.

---

## Why Patrol over plain `integration_test`?

| Need                                        | `integration_test` | Patrol |
| ------------------------------------------- | ------------------ | ------ |
| Tap/scroll/enter text in the Flutter UI     | ✅                 | ✅     |
| Native permission dialogs                   | ❌                 | ✅     |
| Toggle Wi‑Fi / cellular / dark mode         | ❌                 | ✅     |
| Interact with notifications / WebViews      | ❌                 | ✅     |
| Concise finders (`$('text')`)               | ❌                 | ✅     |
| Hot restart during test dev                 | ❌                 | ✅     |
| Test isolation + sharding                   | ⚠️ limited         | ✅     |
| Device farms (Firebase Test Lab, BrowserStack, etc.) | ⚠️ manual | ✅     |

---

# Part A — Reusable Patrol Playbook (project-agnostic)

> These tasks apply to **any** Flutter project. Each is written so it can be lifted into another repo's plan with minimal edits. Project-specific values are marked `<like-this>`.

## G1 — Install & verify the CLI, then add Patrol to the project

### Goal

Install and verify `patrol_cli` **first** (confirming the environment with `patrol doctor`), and **only then** add the `patrol` package to the project. These are **two separate artifacts** and must not be confused:

| Artifact      | Where it lives                          | How it's installed                         |
| ------------- | --------------------------------------- | ------------------------------------------ |
| `patrol`      | `dev_dependencies` in `pubspec.yaml`    | `flutter pub add patrol --dev`             |
| `patrol_cli`  | Global pub tool (**NOT** in `pubspec`)  | `dart pub global activate patrol_cli`      |

### Tasks (follow this exact order — per the official [Install Patrol](https://patrol.leancode.co/documentation) guide)

> **Order matters.** Configure and verify the **CLI first** with `patrol doctor`, and only **then** add the `patrol` package to the project. Do not add the package before the CLI passes `patrol doctor`.

- [ ] **Step 1 — Install the `patrol_cli` first** (global tool, **NOT** a pubspec entry):
  ```bash
  flutter pub global activate patrol_cli
  ```
- [ ] **Step 2 — Add the CLI to `PATH`** so `patrol` is callable (ensure `~/.pub-cache/bin` is on `PATH`).
  For Android targets, also ensure the SDK env vars are set (macOS zsh example):
  ```bash
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export ANDROID_SDK_ROOT="$ANDROID_HOME"
  ```
  Add them to `~/.zshrc` (or your shell profile) and reload the shell before running `patrol doctor`.
- [ ] **Step 3 — Verify the CLI works *before* touching the project** with `patrol doctor`:
  ```bash
  patrol --version   # prints the CLI version
  patrol doctor      # must pass for your target platform before continuing
  ```
  ✋ Do not proceed to Step 4 until `patrol doctor` reports the toolchain (Flutter, Android and/or iOS) as green.
- [ ] **Step 4 — Now add the `patrol` package** as a dev dependency (the only Patrol entry in `pubspec.yaml`):
  ```bash
  flutter pub add patrol --dev
  ```
  Expected in `pubspec.yaml`:
  ```yaml
  dev_dependencies:
    patrol: ^3.x.x   # patrol_cli does NOT go here — it is a global tool
  ```
- [ ] **Step 5 — Re-run `patrol doctor`** now that the package is present, to confirm CLI ↔ package compatibility.

> ⚠️ **Version compatibility:** the `patrol` package and `patrol_cli` are released in lockstep and must be compatible. A mismatch is the most common cause of build / `patrol doctor` failures. If you see runner errors after an upgrade, re-run `dart pub global activate patrol_cli` and bump the `patrol` package to a matching major version.

### `patrol doctor` — what it must report ✅

Run `patrol doctor` after **every** setup step (G1–G3). A healthy, ready-to-run environment reports all of the following. Treat any ❌ / warning as a blocker before moving on:

| Check                          | Healthy output                                                        |
| ------------------------------ | -------------------------------------------------------------------- |
| **Patrol CLI version**         | Prints the installed `patrol_cli` version (and no "update required"). |
| **Patrol package version**     | Resolves the `patrol` dep and shows a version compatible with the CLI. |
| **Flutter**                    | `flutter` found on `PATH`; `flutter doctor` itself is healthy.        |
| **Android toolchain**          | Android SDK, `adb`, and command-line tools detected; `$ANDROID_HOME` is set. |
| **Android test runner**        | `PatrolJUnitRunner` wired in `build.gradle` (after G3).              |
| **iOS toolchain**              | Xcode + CocoaPods detected; `RunnerUITests` target present (after G3). |
| **Connected devices**          | At least one emulator/simulator or physical device (`patrol devices`). |

```bash
patrol doctor            # full report
patrol doctor -v         # verbose: shows exact paths / why a check failed
```

> If a check fails, fix it and re-run `patrol doctor` until **every line is green** before continuing to the next slice.

### Verification

- `patrol doctor` runs and every line reports OK.
- `patrol --version` shows compatible CLI and package versions.

---

## G2 — Configure `patrol` in `pubspec.yaml`

### Goal

Declare the Patrol app id / bundle config so the **CLI** can build native test bundles. This is a top-level `patrol:` block (a sibling of `dependencies:`/`flutter:`), **read only from the project-root `pubspec.yaml`** — not from any nested package.

### Tasks

- [ ] Add the `patrol` config block to the root `pubspec.yaml`:
  ```yaml
  patrol:
    app_name: <App Name>
    test_directory: integration_test   # Patrol defaults to patrol_test/; this plan uses integration_test/
    android:
      package_name: <com.example.app>
    ios:
      bundle_id: <com.example.app>
  ```
- [ ] Values must match the real `applicationId` (Android) and `PRODUCT_BUNDLE_IDENTIFIER` (iOS).
- [ ] Gitignore Patrol's generated bundle (it must **not** be committed):
  ```gitignore
  # Patrol — generated test bundle
  integration_test/test_bundle.dart
  ```

### Verification

- `patrol doctor` no longer warns about missing app config (see the **G1 `patrol doctor` checklist**).

---

## G3 — Native platform configuration

### Goal

Wire Patrol's native test runners into Android and iOS so `integration_test` can drive the app.

### Tasks — Android

- [ ] In `android/app/src/androidTest/java/<pkg path>/MainActivityTest.java` create:
  ```java
  package <com.example.app>;
  import androidx.test.platform.app.InstrumentationRegistry;
  import leancode.patrol.PatrolJUnitRunner;
  import org.junit.runner.RunWith;
  import pl.leancode.patrol.PatrolTestRunner;

  @RunWith(PatrolTestRunner.class)
  public class MainActivityTest {}
  ```
- [ ] In `android/app/build.gradle` (`defaultConfig`):
  ```gradle
  testInstrumentationRunner "pl.leancode.patrol.PatrolJUnitRunner"
  testInstrumentationRunnerArguments clearPackageData: "true"
  ```
- [ ] Add to `android/app/build.gradle` `dependencies`:
  ```gradle
  androidTestUtil "androidx.test:orchestrator:1.4.2"
  ```
- [ ] Set `minSdkVersion` to **at least 21** (Patrol requirement).

### Tasks — iOS

- [ ] Open `ios/Runner.xcworkspace` in Xcode.
- [ ] Add a **UI Testing Bundle** target named `RunnerUITests` (if not present).
- [ ] Replace the generated UI-test file with the Patrol iOS macro runner (Objective-C):
  ```objective-c
  @import XCTest;
  @import patrol;
  @import ObjectiveC.runtime;

  PATROL_INTEGRATION_TEST_IOS_RUNNER(RunnerUITests)
  ```
- [ ] Ensure `RunnerUITests` is included in **Runner scheme → TestAction → Testables**.
- [ ] Add `target 'RunnerUITests' do inherit! :complete end` inside `target 'Runner'` in `ios/Podfile`.
- [ ] Ensure the iOS deployment target is **≥ 13.0**.
- [ ] `cd ios && pod install`.

### Verification

- `patrol doctor` reports **every** line OK — Android + iOS toolchains, test runners, and devices all green (see the **G1 `patrol doctor` checklist**).
- `patrol devices` lists at least one simulator/emulator.

> ⚠️ Patrol's native setup snippets change between major versions. Always copy the **exact** runner code from the docs matching the installed `patrol` version (`patrol --version`).

---

## G4 — Test architecture scaffolding

> Page Object + Chain-of-Responsibility "Flow" design. Create these folders under `integration_test/`.

### Recommended folder structure

```
integration_test/
├── test_bundle.dart                 # entry: aggregates all tests (optional)
├── start_test.dart                  # entry: runs the chained journey
├── config/
│   ├── patrol_test_config.dart      # shared patrolTest wrapper + setup
│   └── test_app.dart                # builds the app under test (with overrides)
├── keys/
│   ├── application_keys.dart        # central ApplicationKeys hub (part files)
│   └── items/
│       ├── general_keys.dart
│       └── <feature>_keys.dart
├── page_objects/
│   └── <feature>_robot.dart         # actions + assertions for a screen
└── flows/
    ├── base_test_scenario.dart      # abstract Flow base (Chain of Responsibility)
    └── <feature>_scenario.dart
```

### Tasks

- [ ] **Keys hub** — central registry using `part`/`part of`:
  ```dart
  // keys/application_keys.dart
  part 'items/general_keys.dart';
  part 'items/home_keys.dart';

  final class ApplicationKeys {
    const ApplicationKeys._();
    static final general = _GeneralKeys._();
    static final home = _HomeKeys._();
  }

  typedef K = ApplicationKeys; // usage: K.home.view
  ```
  ```dart
  // keys/items/home_keys.dart
  part of '../application_keys.dart';

  final class _HomeKeys {
    _HomeKeys._();
    final Key view = const Key('home_view');
  }
  ```
- [ ] **Shared test config** — a `patrolTest` wrapper that pumps the app and applies common setup (DI overrides, native permission handling):
  ```dart
  // config/patrol_test_config.dart
  void appTest(String description, Future<void> Function(PatrolIntegrationTester $) callback) {
    patrolTest(description, ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());
      await callback($);
    });
  }
  ```
- [ ] **Page object (Robot) pattern** — encapsulate finders + actions per screen:
  ```dart
  // page_objects/home_robot.dart
  final class HomeRobot {
    HomeRobot(this.$);
    final PatrolIntegrationTester $;

    Future<void> expectVisible() async => expect($(K.home.view).exists, isTrue);
    Future<void> openFirstMovie() async => $(K.home.firstCard).tap();
  }
  ```
- [ ] **Flow base class** (Chain of Responsibility):
  ```dart
  // flows/base_test_scenario.dart
  abstract base class BaseTestScenario {
    BaseTestScenario(this.$, {this.next});
    final PatrolIntegrationTester $;
    final BaseTestScenario? next;

    Future<bool> run();                 // the test body
    Future<bool> waitAndCheckValid();   // gate: should this flow run?

    Future<void> startFlow() async {
      if (await waitAndCheckValid()) {
        await run();
      }
      await next?.startFlow();          // chain to next scenario
    }
  }
  ```

### Verification

- The scaffolding compiles; a trivial `appTest('boots', ...)` passes.

---

## G5 — Assign `Key`s to widgets (the test contract)

### Goal

Make widgets reliably findable. Prefer `Key`s over text/type finders — they survive copy changes and localization.

### Tasks

- [ ] For each screen/widget under test, assign a `Key` from the `ApplicationKeys` hub:
  ```dart
  Scaffold(key: K.home.view, ...)
  ```
- [ ] Key the **minimum stable anchors** needed: root view, list containers, primary CTAs, list items (often keyed by id, e.g. `Key('movie_card_$id')`).
- [ ] Keep keys in the central hub; never hardcode `Key('...')` strings inside tests.

### Verification

- Every page object resolves its anchors via `K.*` keys.

---

## G6 — Run, debug & CI

### Goal

Standardize how tests are executed locally and in CI.

### Tasks — Local

- [ ] Develop loop (hot restart):
  ```bash
  patrol develop --target integration_test/start_test.dart
  ```
- [ ] Single run:
  ```bash
  patrol test --target integration_test/start_test.dart
  ```
- [ ] Target a specific device:
  ```bash
  patrol test -t integration_test/start_test.dart --device <id>
  ```
- [ ] Add convenience scripts (`scripts/patrol_ios.sh`, `scripts/patrol_android.sh`) that auto-pick the booted simulator/emulator.

### Tasks — CI / Device farm

- [ ] Build test bundles:
  ```bash
  patrol build android --target integration_test/start_test.dart
  patrol build ios     --target integration_test/start_test.dart
  ```
- [ ] Run on **Firebase Test Lab** (Android example):
  ```bash
  gcloud firebase test android run \
    --type instrumentation \
    --use-orchestrator \
    --app build/app/outputs/apk/debug/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --device model=MediumPhone.arm,version=34,locale=en,orientation=portrait \
    --record-video \
    --environment-variables clearPackageData=true
  ```
- [ ] Add a **GitHub Actions** workflow that activates `patrol_cli`, builds the bundle, and uploads to the farm.

### Verification

- Tests pass locally on a simulator/emulator and produce a recorded run on the farm.

---

# Part B — Cinemapedia-Specific Slices

> Concrete work for **this** app. App facts: Flutter SDK `>=3.10.7`, Riverpod 3 (codegen), `go_router` with 3 bottom-nav tabs (`/`, `/categories`, `/favorites`) + pushed detail route `/movie/:mid`, TMDB API via Dio, `.env` loaded in `main()`, favorites persisted via `SharedPreferences`.

## Project considerations (read first)

| Concern                     | Decision for this plan                                                                                                                                                |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`.env` / TMDB key**       | Tests boot the real app, which calls `dotenv.load('.env')`. The `.env` must be present in the test bundle (already a declared asset). Keep a CI secret for the key.   |
| **Real API vs mocked**      | **Default: mock the repositories** via `ProviderScope` overrides for deterministic, offline, fast tests. Keep a small **smoke suite** that hits the real TMDB API.    |
| **State isolation**         | Clear `SharedPreferences` (favorites) between favorites tests so runs are repeatable.                                                                                 |
| **Keys**                    | The app currently has **almost no widget `Key`s**; `S2` adds them feature-by-feature.                                                                                 |
| **Entry point**             | A dedicated test app builder wraps `MainApp` with overridable `ProviderScope` (no `BackgroundDetector` noise).                                                        |

---

## Slice Overview

| Slice  | Description                                  | Depends on | Risk   |
| ------ | -------------------------------------------- | ---------- | ------ |
| **S1** | Install + native config (apply G1–G3)        | —          | Medium |
| **S2** | Add `Key`s to feature widgets (apply G5)     | S1         | Low    |
| **S3** | Test scaffolding: keys hub, robots, flows, config, mock overrides (apply G4) | S1 | Medium |
| **S4** | Smoke test: app boots, 3 tabs reachable       | S3         | Low    |
| **S5** | Home feature E2E                              | S4         | Low    |
| **S6** | Movie detail E2E + navigation/back            | S5         | Low    |
| **S7** | Search feature E2E (text entry + results)     | S4         | Medium |
| **S8** | Categories + Favorites E2E (persistence)      | S4         | Medium |
| **S9** | Native interactions + CI/CD (apply G6)        | S5–S8      | Medium |

```
S1 → S2 → S3 → S4 ──┬── S5 → S6 ──┐
                    ├── S7 ───────┤
                    └── S8 ───────┴── S9
```

---

## S1 — Install & native configuration

### Goal

Get Patrol building and running an empty test on this app.

### Tasks

- [ ] Apply **G1** (install `patrol` + `patrol_cli`).
- [ ] Apply **G2** with this app's ids:
  ```yaml
  patrol:
    app_name: Cinemapedia
    test_directory: integration_test
    android:
      package_name: com.example.cinemapedia_flutter
    ios:
      bundle_id: com.example.cinemapediaFlutter
  ```
- [ ] Apply **G3** (Android `MainActivityTest`, gradle runner, iOS `RunnerUITests`).
- [ ] Confirm iOS deployment target ≥ 13.0 (already bumped in recent platform commit).
- [ ] Add `integration_test/example_test.dart` that pumps `MainApp` and asserts it builds.

### Verification

- `patrol doctor` reports every line OK (CLI, package, Android, iOS, devices) before running any test.
- `patrol test -t integration_test/example_test.dart` launches the app on a simulator/emulator and passes.

---

## S2 — Assign Keys to feature widgets

### Goal

Make every screen and key interaction point findable.

### Tasks

- [ ] Create the keys hub (`integration_test/keys/`) with per-feature part files: `home`, `movie_detail`, `categories`, `search`, `favorites`, `general`.
- [ ] **Home** (`features/home/.../screens/home_view.dart`): key the root view, the slideshow, each `MovieHorizontalListView`, and movie cards (`Key('movie_card_$id')`).
- [ ] **Bottom nav** (`core/.../custom_bottom_navigation.dart`): key each tab item.
- [ ] **Movie detail** (`features/movie_detail/.../movie_screen.dart`): key the root, the favorite button, cast list, trailers section, similar list.
- [ ] **Search** (`features/search/.../search_movie_delegate.dart` + `custom_appbar.dart`): key the search icon, the text field, result tiles.
- [ ] **Categories** (`features/categories/.../categories_view.dart`): key genre cards and the movie grid.
- [ ] **Favorites** (`features/favorites/.../favorites_view.dart`): key the empty state, the masonry grid, the favorite toggle.

### Verification

- App still builds and runs; `flutter analyze` clean.
- Keys are referenced only from the central hub.

---

## S3 — Test scaffolding & deterministic data

### Goal

Stand up the reusable architecture plus mock overrides so tests are fast and offline.

### Tasks

- [ ] Apply **G4** scaffolding (`config/`, `keys/`, `page_objects/`, `flows/`).
- [ ] `config/test_app.dart` — build `MainApp` inside an overridable `ProviderScope`:
  ```dart
  Widget buildTestApp({List<Override> overrides = const []}) =>
      ProviderScope(overrides: overrides, child: const MainApp());
  ```
- [ ] Create **fake repositories** implementing `MoviesRepository` / `ActorsRepository` returning fixture data (a handful of `Movie`, `Actor`, `Genre`, `Video`).
- [ ] Override `movieRepositoryProvider` / `actorsRepositoryProvider` in the test config so no network is hit.
- [ ] Add a `SharedPreferences.setMockInitialValues({})` helper for favorites isolation.
- [ ] Create page-object robots: `HomeRobot`, `MovieDetailRobot`, `SearchRobot`, `CategoriesRobot`, `FavoritesRobot`.
- [ ] Create `flows/base_test_scenario.dart` and one example scenario.

### Verification

- An `appTest('home boots with fixtures', ...)` renders the home screen using mock data, no network call.

---

## S4 — Smoke test (navigation skeleton)

### Goal

Prove the shell + routing works end-to-end.

### Tasks

- [ ] Test: app boots → Home tab visible.
- [ ] Tap **Categories** tab → categories view visible.
- [ ] Tap **Favorites** tab → favorites view (empty state) visible.
- [ ] Tap back to **Home** → home view visible.

### Verification

- All three branches of `StatefulShellRoute` are reachable and keyed views resolve.

---

## S5 — Home feature E2E

### Goal

Validate the discovery feed.

### Tasks

- [ ] Assert slideshow renders with fixture movies.
- [ ] Assert each horizontal list ("In Cinemas", "Coming Soon", "Popular", "Best calification") renders cards.
- [ ] Scroll a horizontal list → assert pagination callback loads more (fixtures return a 2nd page).
- [ ] Tap a movie card → navigates to `/movie/:id` (hands off to S6).

### Verification

- `HomeRobot` actions/assertions pass against fixtures.

---

## S6 — Movie detail E2E

### Goal

Validate the detail screen and navigation.

### Tasks

- [ ] From Home, open the first movie → detail view visible with title/overview.
- [ ] Assert cast list, trailers section, and similar-movies list render.
- [ ] Tap the **favorite** toggle → icon switches to filled/red.
- [ ] Tap a **similar movie** card → pushes a new detail route.
- [ ] Press back → returns to the previous detail / home.

### Verification

- Forward + back navigation works; favorite toggle reflects state.

---

## S7 — Search feature E2E

### Goal

Validate the search overlay (`SearchDelegate`) including text entry.

### Tasks

- [ ] Tap the app bar **search** icon → search overlay opens.
- [ ] Enter a query → assert debounced results list renders (fixture results).
- [ ] Enter an empty/garbage query → assert "No movies found" / idle state.
- [ ] Tap a result → closes search and navigates to `/movie/:id`.
- [ ] (Optional native) dismiss the soft keyboard via `$.native`.

### Verification

- Live search returns fixtures; selection navigates correctly.

---

## S8 — Categories & Favorites E2E

### Goal

Validate genre browsing and persisted favorites.

### Tasks — Categories

- [ ] Categories tab → genre grid renders.
- [ ] Tap a genre → genre detail with movie grid renders.
- [ ] Scroll → pagination loads more for that genre.

### Tasks — Favorites (persistence)

- [ ] Start with cleared `SharedPreferences` → favorites empty state shown.
- [ ] Favorite a movie from the detail screen → it appears in the Favorites tab.
- [ ] Re-pump the app (simulate restart) → favorite still present (loaded from prefs).
- [ ] Un-favorite → removed from the grid.

### Verification

- Favorites survive an app re-pump; categories pagination works.

---

## S9 — Native interactions & CI/CD

### Goal

Exercise Patrol's native powers and automate runs.

### Tasks — Native

- [ ] Take a screenshot at a key step (`$.native.takeScreenshot(...)` / Patrol screenshot API).
- [ ] (If/when a permission dialog is added) handle it via `$.native.grantPermissionWhenInUse()` / `denyPermission()`.
- [ ] Toggle dark mode (`$.native.enableDarkMode()`) and assert the theme renders.

### Tasks — CI/CD (apply G6)

- [ ] Add `scripts/patrol_ios.sh` and `scripts/patrol_android.sh` device-picker scripts.
- [ ] Add `.github/workflows/patrol.yml`: activate `patrol_cli`, inject the TMDB key as a secret into `.env`, `patrol build`, upload to Firebase Test Lab.
- [ ] Document the local + CI commands in `docs/features/` (testing reference).

### Verification

- Green run locally and on Firebase Test Lab with a recorded video.

---

## Risk Mitigation

| Risk                                              | Impact                  | Mitigation                                                                              |
| ------------------------------------------------- | ----------------------- | -------------------------------------------------------------------------------------- |
| Native runner snippets differ per Patrol version  | Build fails             | Always copy the exact code from docs matching `patrol --version`; run `patrol doctor`.  |
| Tests hit real TMDB → flaky/slow/rate-limited     | Flaky CI                | Mock repositories via `ProviderScope` overrides; keep real-API tests in a tiny smoke set. |
| `.env` missing in test bundle                     | App fails to boot       | Keep `.env` as a declared asset; inject the key from a CI secret.                       |
| Favorites state leaks between tests               | Order-dependent fails   | `SharedPreferences.setMockInitialValues({})` before each favorites test.               |
| Missing widget keys → brittle text finders        | Flaky selectors         | Complete `S2` before writing assertions; resolve all anchors from the keys hub.         |
| iOS UI Test target misconfigured                  | iOS tests won't run     | Verify the `RunnerUITests` target + deployment target ≥ 13 in Xcode; `pod install`.     |

---

## Definition of Done

- [ ] `patrol test -t integration_test/start_test.dart` passes locally on Android **and** iOS.
- [ ] Home, Movie Detail, Search, Categories, Favorites each have a passing scenario.
- [ ] Favorites persistence verified across an app re-pump.
- [ ] At least one native interaction (screenshot or dark mode) exercised.
- [ ] CI workflow builds the bundle and runs on a device farm.
- [ ] All widget anchors resolved via the central `ApplicationKeys` hub (no inline `Key('...')` in tests).
- [ ] `flutter analyze` clean; no network calls in the default (mocked) suite.

---

## Appendix — Command cheat sheet

```bash
# Setup
flutter pub add patrol --dev
dart pub global activate patrol_cli
patrol doctor          # must be all-green before running tests
patrol doctor -v       # verbose diagnosis when a check fails
patrol devices

# Develop (hot restart)
patrol develop --target integration_test/start_test.dart

# Run
patrol test --target integration_test/start_test.dart
patrol test -t integration_test/start_test.dart --device <id>

# Build for device farms
patrol build android --target integration_test/start_test.dart
patrol build ios     --target integration_test/start_test.dart
```
