import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_flutter/core/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/presentation/testing/patrol_keys.dart';
import 'package:cinemapedia_flutter/features/categories/presentation/providers/genres_provider.dart';
import 'package:cinemapedia_flutter/features/categories/presentation/providers/movies_by_genre_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends ConsumerStatefulWidget {
  const CategoriesView({super.key});

  @override
  ConsumerState<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends ConsumerState<CategoriesView> {
  int? _selectedGenreId;

  @override
  void initState() {
    super.initState();
    ref.read(genresProvider.notifier).loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(genresProvider);
    final moviesByGenre = ref.watch(moviesByGenreProvider);

    if (genres.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    // No genre selected → show the genre grid
    if (_selectedGenreId == null) {
      return Scaffold(
        key: const Key(PatrolKeys.categoriesView),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                key: const Key(PatrolKeys.categoriesGrid),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final genre = genres[index];
                  return FadeInUp(
                    delay: Duration(milliseconds: index * 50),
                    duration: const Duration(milliseconds: 400),
                    child: _GenreCard(
                      cardKey: PatrolKeys.categoryCard(genre.id),
                      genre: genre,
                      onTap: () {
                        setState(() => _selectedGenreId = genre.id);
                        if (moviesByGenre[genre.id] == null) {
                          ref
                              .read(moviesByGenreProvider.notifier)
                              .loadMoviesByGenre(genre.id);
                        }
                      },
                    ),
                  );
                }, childCount: genres.length),
              ),
            ),
          ],
        ),
      );
    }

    // Genre selected → show genre detail page
    final genre = genres.firstWhere((g) => g.id == _selectedGenreId);
    final movies = moviesByGenre[_selectedGenreId] ?? [];

    return Scaffold(
      key: const Key(PatrolKeys.categoryDetailView),
      body: CustomScrollView(
        slivers: [
          // Hero header with genre gradient
          _GenreDetailHeader(
            genre: genre,
            movieCount: movies.length,
            onBack: () => setState(() => _selectedGenreId = null),
          ),

          // Featured movie spotlight (first movie with backdrop)
          if (movies.isNotEmpty)
            SliverToBoxAdapter(
              child: FadeIn(
                child: _FeaturedMovieSpotlight(movie: movies.first),
              ),
            ),

          // Stats bar
          if (movies.isNotEmpty)
            SliverToBoxAdapter(
              child: FadeInLeft(child: _GenreStatsBar(movies: movies)),
            ),

          // Section title
          if (movies.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Row(
                  children: [
                    Icon(genre.icon, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'All ${genre.name} Movies',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Movie grid
          if (movies.isEmpty)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverGrid(
                key: const Key(PatrolKeys.categoryMoviesGrid),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index >= movies.length) return null;

                  // Trigger infinite scroll near the end
                  if (index == movies.length - 5) {
                    ref
                        .read(moviesByGenreProvider.notifier)
                        .loadMoviesByGenre(_selectedGenreId!);
                  }

                  return FadeInUp(
                    delay: Duration(milliseconds: (index % 6) * 60),
                    child: _MovieGridTile(movie: movies[index]),
                  );
                }, childCount: movies.length),
              ),
            ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

// ──────────────────────────── Genre Card (grid item) ────────────────────────

class _GenreCard extends StatelessWidget {
  final Genre genre;
  final VoidCallback onTap;
  final Key? cardKey;

  const _GenreCard({required this.genre, required this.onTap, this.cardKey});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: cardKey,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: genre.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Large faded icon in background
              Positioned(
                right: -10,
                bottom: -10,
                child: Icon(
                  genre.icon,
                  size: 70,
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(genre.icon, color: Colors.white, size: 28),
                    const Spacer(),
                    Text(
                      genre.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      genre.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────── Genre Detail Header ───────────────────────────

class _GenreDetailHeader extends StatelessWidget {
  final Genre genre;
  final int movieCount;
  final VoidCallback onBack;

  const _GenreDetailHeader({
    required this.genre,
    required this.movieCount,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: onBack,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(genre.icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Text(genre.name),
          ],
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: genre.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    genre.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (movieCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$movieCount movies loaded',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────── Featured Movie Spotlight ───────────────────────

class _FeaturedMovieSpotlight extends StatelessWidget {
  final Movie movie;

  const _FeaturedMovieSpotlight({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Backdrop image
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  movie.backdropPath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.movie,
                      size: 60,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.85),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.3, 1.0],
                    ),
                  ),
                ),
              ),
              // Spotlight badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'SPOTLIGHT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Movie info
              Positioned(
                bottom: 12,
                left: 14,
                right: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.overview,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber.shade400,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.amber.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white54,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${movie.releaseDate.year}',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white38),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────── Genre Stats Bar ───────────────────────────────

class _GenreStatsBar extends StatelessWidget {
  final List<Movie> movies;

  const _GenreStatsBar({required this.movies});

  @override
  Widget build(BuildContext context) {
    final avgRating = movies.isEmpty
        ? 0.0
        : movies.map((m) => m.voteAverage).reduce((a, b) => a + b) /
              movies.length;

    final highestRated = movies.isEmpty
        ? null
        : movies.reduce((a, b) => a.voteAverage > b.voteAverage ? a : b);

    final avgPopularity = movies.isEmpty
        ? 0.0
        : movies.map((m) => m.popularity).reduce((a, b) => a + b) /
              movies.length;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(
            icon: Icons.star_rate_rounded,
            iconColor: Colors.amber,
            label: 'Avg Rating',
            value: avgRating.toStringAsFixed(1),
          ),
          Container(width: 1, height: 30, color: Colors.grey.shade400),
          _StatItem(
            icon: Icons.trending_up,
            iconColor: Colors.green,
            label: 'Avg Popularity',
            value: avgPopularity.toStringAsFixed(0),
          ),
          Container(width: 1, height: 30, color: Colors.grey.shade400),
          _StatItem(
            icon: Icons.emoji_events,
            iconColor: Colors.orange,
            label: 'Best Rated',
            value: highestRated?.voteAverage.toStringAsFixed(1) ?? '-',
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
        ),
      ],
    );
  }
}

// ──────────────────────────── Movie Grid Tile ───────────────────────────────

class _MovieGridTile extends StatelessWidget {
  final Movie movie;

  const _MovieGridTile({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (_, child, progress) {
                      if (progress != null) {
                        return Container(
                          color: Colors.grey.shade800,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      }
                      return FadeIn(child: child);
                    },
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade800,
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                  // Rating badge
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.amber.shade400,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            '${movie.releaseDate.year}',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
