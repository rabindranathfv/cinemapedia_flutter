import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
abstract class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'belongs_to_collection')
    BelongsToCollection? belongsToCollection,
    @Default(0) int budget,
    @Default([]) List<MovieDetailsGenre> genres,
    @Default('') String homepage,
    required int id,
    @JsonKey(name: 'imdb_id') @Default('') String imdbId,
    @JsonKey(name: 'origin_country') @Default([]) List<String> originCountry,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'production_companies')
    @Default([])
    List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries')
    @Default([])
    List<ProductionCountry> productionCountries,
    @_DateTimeSerializer()
    @JsonKey(name: 'release_date')
    required DateTime releaseDate,
    @Default(0) int revenue,
    @Default(0) int runtime,
    @JsonKey(name: 'spoken_languages')
    @Default([])
    List<SpokenLanguage> spokenLanguages,
    @Default('') String status,
    @Default('') String tagline,
    @Default('') String title,
    @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}

@freezed
abstract class BelongsToCollection with _$BelongsToCollection {
  const factory BelongsToCollection({
    required int id,
    @Default('') String name,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
  }) = _BelongsToCollection;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@freezed
abstract class MovieDetailsGenre with _$MovieDetailsGenre {
  const factory MovieDetailsGenre({required int id, @Default('') String name}) =
      _MovieDetailsGenre;

  factory MovieDetailsGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsGenreFromJson(json);
}

@freezed
abstract class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @Default('') String name,
    @JsonKey(name: 'origin_country') @Default('') String originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') @Default('') String iso31661,
    @Default('') String name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') @Default('') String englishName,
    @JsonKey(name: 'iso_639_1') @Default('') String iso6391,
    @Default('') String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

class _DateTimeSerializer implements JsonConverter<DateTime, dynamic> {
  const _DateTimeSerializer();

  @override
  DateTime fromJson(dynamic value) =>
      DateTime.tryParse(value?.toString() ?? '') ?? DateTime(0);

  @override
  String toJson(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}
