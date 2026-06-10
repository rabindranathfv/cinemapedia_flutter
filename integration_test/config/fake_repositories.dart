import 'package:cinemapedia_flutter/core/domain/entities/actor.dart';
import 'package:cinemapedia_flutter/core/domain/entities/genre.dart';
import 'package:cinemapedia_flutter/core/domain/entities/movie.dart';
import 'package:cinemapedia_flutter/core/domain/entities/video.dart';
import 'package:cinemapedia_flutter/core/domain/repositories/actors_repository.dart';
import 'package:cinemapedia_flutter/core/domain/repositories/movies_repository.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/actors_repository_provider.dart';
import 'package:cinemapedia_flutter/core/presentation/providers/movies_repository_provider.dart';

const _poster =
    'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg';
const _backdrop =
    'https://image.tmdb.org/t/p/w500/1w8Z0U0C6V0f7mE0R7fQxQ6M3NQ.jpg';

final List<Movie> _fixtureMovies = [
  Movie(
    adult: false,
    backdropPath: _backdrop,
    genreIds: const ['Action', 'Sci-Fi'],
    id: 11,
    originalLanguage: 'en',
    originalTitle: 'Star Wars',
    overview: 'A young farm boy joins the rebellion to save the galaxy.',
    popularity: 2000,
    posterPath: _poster,
    releaseDate: DateTime(1977, 5, 25),
    title: 'Star Wars',
    video: false,
    voteAverage: 8.6,
    voteCount: 12000,
  ),
  Movie(
    adult: false,
    backdropPath: _backdrop,
    genreIds: const ['Adventure', 'Sci-Fi'],
    id: 1891,
    originalLanguage: 'en',
    originalTitle: 'The Empire Strikes Back',
    overview: 'The rebels face the Empire while Luke trains with Yoda.',
    popularity: 1700,
    posterPath: _poster,
    releaseDate: DateTime(1980, 5, 21),
    title: 'Star Wars: The Empire Strikes Back',
    video: false,
    voteAverage: 8.7,
    voteCount: 11000,
  ),
  Movie(
    adult: false,
    backdropPath: _backdrop,
    genreIds: const ['Adventure', 'Sci-Fi'],
    id: 1892,
    originalLanguage: 'en',
    originalTitle: 'Return of the Jedi',
    overview: 'The rebellion launches a final mission against the Empire.',
    popularity: 1600,
    posterPath: _poster,
    releaseDate: DateTime(1983, 5, 25),
    title: 'Star Wars: Return of the Jedi',
    video: false,
    voteAverage: 8.4,
    voteCount: 9000,
  ),
];

final List<Genre> _fixtureGenres = const [
  Genre(id: 28, name: 'Action'),
  Genre(id: 878, name: 'Science Fiction'),
  Genre(id: 12, name: 'Adventure'),
];

final List<Video> _fixtureVideos = const [
  Video(
    id: 'v1',
    name: 'Official Trailer',
    key: 'abc123',
    site: 'YouTube',
    type: 'Trailer',
    official: true,
    publishedAt: '1977-01-01',
  ),
];

final List<Actor> _fixtureActors = const [
  Actor(id: 1, name: 'Mark Hamill', profilePath: _poster, character: 'Luke'),
  Actor(id: 2, name: 'Carrie Fisher', profilePath: _poster, character: 'Leia'),
];

class FakeMoviesRepository implements MoviesRepository {
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async => _fixtureMovies;

  @override
  Future<List<Movie>> getPopular({int page = 1}) async => _fixtureMovies;

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async => _fixtureMovies;

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async => _fixtureMovies;

  @override
  Future<Movie> getMovieById(String id) async {
    return _fixtureMovies.firstWhere((movie) => movie.id.toString() == id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final lowerQuery = query.toLowerCase();
    return _fixtureMovies
        .where((movie) => movie.title.toLowerCase().contains(lowerQuery))
        .toList();
  }

  @override
  Future<List<Genre>> getGenres() async => _fixtureGenres;

  @override
  Future<List<Movie>> getMoviesByGenre(int genreId, {int page = 1}) async {
    final genreName = _fixtureGenres
        .firstWhere((genre) => genre.id == genreId, orElse: () => _fixtureGenres.first)
        .name;
    return _fixtureMovies
        .where((movie) => movie.genreIds.any((g) => g.contains(genreName.split(' ').first)))
        .toList();
  }

  @override
  Future<List<Video>> getMovieVideos(String movieId) async => _fixtureVideos;

  @override
  Future<List<Movie>> getSimilarMovies(String movieId) async {
    return _fixtureMovies
        .where((movie) => movie.id.toString() != movieId)
        .toList();
  }
}

class FakeActorsRepository implements ActorsRepository {
  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async => _fixtureActors;
}

List testRepositoryOverrides() {
  return [
    movieRepositoryProvider.overrideWith((ref) => FakeMoviesRepository()),
    actorsRepositoryProvider.overrideWith((ref) => FakeActorsRepository()),
  ];
}
