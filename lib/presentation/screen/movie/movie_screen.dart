import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('movieId: ${widget.movieId}'),
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Text(movie.title),
      ),
    );
  }
}
