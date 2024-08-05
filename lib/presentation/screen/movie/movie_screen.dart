import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieScreen extends StatelessWidget {
  static const String name = 'movie_screen';
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movieId: ${movieId}'),
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text('movie movie'),
      ),
    );
  }
}
