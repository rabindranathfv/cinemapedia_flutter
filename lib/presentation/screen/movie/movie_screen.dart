import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_flutter/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const String name = 'movie_screen';
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('movieId: ${widget.movieId}'),
      //   leading: IconButton(
      //       onPressed: () => context.pop(),
      //       icon: const Icon(Icons.arrow_back)),
      // ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _MovieDetails(movie: movie);
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({required this.movie});

  Color generateRandomBlueColor() {
    final random = Random();
    final hueColor = (220 + random.nextInt(40)).toDouble();
    final saturation = random.nextDouble() * 0.8 + 0.2;
    final lightness = random.nextDouble() * 0.5 + 0.25;
    return HSLColor.fromAHSL(1.0, hueColor, saturation, lightness).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) return SizedBox();
                    return FadeIn(child: child);
                  },
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.originalTitle, style: textStyle.titleLarge),
                    Row(
                      children: [
                        const Icon(Icons.language),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Original Language: ${movie.originalLanguage.toUpperCase()}',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.group,
                              color: Colors.blue,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text('${(movie.popularity / 2).toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    Text(movie.overview),
                  ],
                ),
              ),
            ],
          ),
        ),

        // TODO: Categories
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(gender, style: TextStyle(color: Colors.white)),
                    backgroundColor: generateRandomBlueColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),

        _ActorsByMovie(movieId: '${movie.id}'),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;
  const _ActorsByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actors = ref.watch(actorsByMovieProvider);

    if (actors[movieId] == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    final actorsMovie = actors[movieId];
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actorsMovie!.length,
        itemBuilder: (context, index) {
          final actor = actorsMovie[index];
          return Container(
            width: 135,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    actor.profilePath,
                    width: 135,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  actor.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Text(
                  actor.character ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.25],
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
        // title: Text(
        //   movie.title,
        //   textAlign: TextAlign.start,
        //   style: const TextStyle(fontSize: 15, color: Colors.white),
        // ),
      ),
    );
  }
}
