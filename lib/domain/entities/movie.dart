class Movie {
  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json['adult'] ?? false,
    backdropPath: json['backdropPath'] ?? '',
    genreIds: List<String>.from(json['genreIds'] ?? []),
    id: json['id'],
    originalLanguage: json['originalLanguage'] ?? '',
    originalTitle: json['originalTitle'] ?? '',
    overview: json['overview'] ?? '',
    popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    posterPath: json['posterPath'] ?? '',
    releaseDate: DateTime.tryParse(json['releaseDate'] ?? '') ?? DateTime(0),
    title: json['title'] ?? '',
    video: json['video'] ?? false,
    voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0.0,
    voteCount: json['voteCount'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdropPath': backdropPath,
    'genreIds': genreIds,
    'id': id,
    'originalLanguage': originalLanguage,
    'originalTitle': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'posterPath': posterPath,
    'releaseDate': releaseDate.toIso8601String(),
    'title': title,
    'video': video,
    'voteAverage': voteAverage,
    'voteCount': voteCount,
  };
}
