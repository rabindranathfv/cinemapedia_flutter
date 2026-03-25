// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetails _$MovieDetailsFromJson(
  Map<String, dynamic> json,
) => _MovieDetails(
  adult: json['adult'] as bool? ?? false,
  backdropPath: json['backdrop_path'] as String? ?? '',
  belongsToCollection: json['belongs_to_collection'] == null
      ? null
      : BelongsToCollection.fromJson(
          json['belongs_to_collection'] as Map<String, dynamic>,
        ),
  budget: (json['budget'] as num?)?.toInt() ?? 0,
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => MovieDetailsGenre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  homepage: json['homepage'] as String? ?? '',
  id: (json['id'] as num).toInt(),
  imdbId: json['imdb_id'] as String? ?? '',
  originCountry:
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  originalLanguage: json['original_language'] as String? ?? '',
  originalTitle: json['original_title'] as String? ?? '',
  overview: json['overview'] as String? ?? '',
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
  posterPath: json['poster_path'] as String? ?? '',
  productionCompanies:
      (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  productionCountries:
      (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  releaseDate: const _DateTimeSerializer().fromJson(json['release_date']),
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
  runtime: (json['runtime'] as num?)?.toInt() ?? 0,
  spokenLanguages:
      (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  status: json['status'] as String? ?? '',
  tagline: json['tagline'] as String? ?? '',
  title: json['title'] as String? ?? '',
  video: json['video'] as bool? ?? false,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MovieDetailsToJson(_MovieDetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': const _DateTimeSerializer().toJson(instance.releaseDate),
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

_BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    _BelongsToCollection(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
  _BelongsToCollection instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
};

_MovieDetailsGenre _$MovieDetailsGenreFromJson(Map<String, dynamic> json) =>
    _MovieDetailsGenre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MovieDetailsGenreToJson(_MovieDetailsGenre instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    _ProductionCompany(
      id: (json['id'] as num).toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String? ?? '',
      originCountry: json['origin_country'] as String? ?? '',
    );

Map<String, dynamic> _$ProductionCompanyToJson(_ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

_ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    _ProductionCountry(
      iso31661: json['iso_3166_1'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ProductionCountryToJson(_ProductionCountry instance) =>
    <String, dynamic>{'iso_3166_1': instance.iso31661, 'name': instance.name};

_SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    _SpokenLanguage(
      englishName: json['english_name'] as String? ?? '',
      iso6391: json['iso_639_1'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SpokenLanguageToJson(_SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
