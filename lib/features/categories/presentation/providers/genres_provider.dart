import 'package:cinemapedia_flutter/core/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genres_provider.g.dart';

@Riverpod(keepAlive: true)
class Genres extends _$Genres {
  @override
  List<Genre> build() => [];

  Future<void> loadGenres() async {
    if (state.isNotEmpty) return;
    final genres = await ref.read(movieRepositoryProvider).getGenres();
    state = genres;
  }
}
