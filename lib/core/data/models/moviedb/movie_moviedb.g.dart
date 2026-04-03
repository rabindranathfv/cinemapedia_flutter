// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_moviedb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieMovieDB _$MovieMovieDBFromJson(Map<String, dynamic> json) =>
    _MovieMovieDB(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
      genreIds:
          (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: const _DateTimeSerializer().fromJson(json['release_date']),
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MovieMovieDBToJson(_MovieMovieDB instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': const _DateTimeSerializer().toJson(instance.releaseDate),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
