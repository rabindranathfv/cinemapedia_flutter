# Navigation & Routing

**File:** `lib/config/router/app_router.dart`  
**Package:** `go_router`

---

## Overview

The app uses a `StatefulShellRoute.indexedStack` for three persistent bottom-navigation tabs. Each tab branch has its own navigator key, preserving scroll position and state when switching tabs.

---

## App Router Factory

```dart
GoRouter createAppRouter()
```

Called in `main.dart` / `MainApp`:

```dart
MaterialApp.router(routerConfig: createAppRouter())
```

**Config:**

| Property          | Value                                     |
| ----------------- | ----------------------------------------- |
| `navigatorKey`    | `rootNavigatorKey` (debugLabel: `'root'`) |
| `initialLocation` | `'/'`                                     |

---

## Navigator Keys

| Key                    | debugLabel               | Scope                                    |
| ---------------------- | ------------------------ | ---------------------------------------- |
| `rootNavigatorKey`     | `'root'`                 | Global navigator (used by pushed routes) |
| `sectionHomeKey`       | `'sectionHomeNav'`       | Home tab branch                          |
| `sectionCategoriesKey` | `'sectionCategoriesNav'` | Categories tab branch                    |
| `sectionFavoritesKey`  | `'sectionFavoritesNav'`  | Favorites tab branch                     |

---

## Route Tree

```
StatefulShellRoute.indexedStack
└── builder: HomeScreen(navigationShell: navigationShell)
    │
    ├── StatefulShellBranch (navigatorKey: sectionHomeKey)
    │   └── GoRoute(path: '/', name: 'home_screen')
    │       builder: HomeView()
    │       └── GoRoute(path: 'movie/:mid', name: 'movie_screen')
    │               builder: MovieScreen(movieId: state.pathParameters['mid']!)
    │
    ├── StatefulShellBranch (navigatorKey: sectionCategoriesKey)
    │   └── GoRoute(path: '/categories')
    │       builder: CategoriesView()
    │
    └── StatefulShellBranch (navigatorKey: sectionFavoritesKey)
        └── GoRoute(path: '/favorites')
            builder: FavoritesView()
```

---

## Routes

### `/`

| Property  | Value           |
| --------- | --------------- |
| Name      | `'home_screen'` |
| Builder   | `HomeView()`    |
| Tab index | 0               |

### `/categories`

| Property  | Value              |
| --------- | ------------------ |
| Builder   | `CategoriesView()` |
| Tab index | 1                  |

### `/favorites`

| Property  | Value             |
| --------- | ----------------- |
| Builder   | `FavoritesView()` |
| Tab index | 2                 |

### `movie/:mid`

| Property  | Value                                                |
| --------- | ---------------------------------------------------- |
| Name      | `'movie_screen'`                                     |
| Full path | `/movie/:mid` (nested under `/`)                     |
| Builder   | `MovieScreen(movieId: state.pathParameters['mid']!)` |
| Tab       | Pushes over Home tab (uses `rootNavigatorKey`)       |

The `:mid` segment is the TMDB movie ID as a string.

---

## Navigation Calls

| Call                                                     | Origin                                                         | Destination                                |
| -------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------ |
| `context.go('/')`                                        | Favorites app bar back button                                  | Home tab root                              |
| `context.push('/movie/${movie.id}')`                     | Movie cards, similar movies, search result, featured spotlight | Movie detail (push — preserves back stack) |
| `context.go('/movie/${movie.id}')`                       | `_Slide` in `MoviesSlideshow`                                  | Movie detail (replace — no back)           |
| `navigationShell.goBranch(index)`                        | `CustomBottomNavigation.onTap`                                 | Switch tabs                                |
| `navigationShell.goBranch(index, initialLocation: true)` | Same-tab tap                                                   | Navigate to tab's root route               |

---

## Page Transitions

No custom transitions configured. go_router default platform transitions apply (slide on iOS, fade/none on Android).
