// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetails {

 bool get adult;@JsonKey(name: 'backdrop_path') String get backdropPath;@JsonKey(name: 'belongs_to_collection') BelongsToCollection? get belongsToCollection; int get budget; List<MovieDetailsGenre> get genres; String get homepage; int get id;@JsonKey(name: 'imdb_id') String get imdbId;@JsonKey(name: 'origin_country') List<String> get originCountry;@JsonKey(name: 'original_language') String get originalLanguage;@JsonKey(name: 'original_title') String get originalTitle; String get overview; double get popularity;@JsonKey(name: 'poster_path') String get posterPath;@JsonKey(name: 'production_companies') List<ProductionCompany> get productionCompanies;@JsonKey(name: 'production_countries') List<ProductionCountry> get productionCountries;@_DateTimeSerializer()@JsonKey(name: 'release_date') DateTime get releaseDate; int get revenue; int get runtime;@JsonKey(name: 'spoken_languages') List<SpokenLanguage> get spokenLanguages; String get status; String get tagline; String get title; bool get video;@JsonKey(name: 'vote_average') double get voteAverage;@JsonKey(name: 'vote_count') int get voteCount;
/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsCopyWith<MovieDetails> get copyWith => _$MovieDetailsCopyWithImpl<MovieDetails>(this as MovieDetails, _$identity);

  /// Serializes this MovieDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetails&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.belongsToCollection, belongsToCollection) || other.belongsToCollection == belongsToCollection)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other.productionCompanies, productionCompanies)&&const DeepCollectionEquality().equals(other.productionCountries, productionCountries)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other.spokenLanguages, spokenLanguages)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,belongsToCollection,budget,const DeepCollectionEquality().hash(genres),homepage,id,imdbId,const DeepCollectionEquality().hash(originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,const DeepCollectionEquality().hash(productionCompanies),const DeepCollectionEquality().hash(productionCountries),releaseDate,revenue,runtime,const DeepCollectionEquality().hash(spokenLanguages),status,tagline,title,video,voteAverage,voteCount]);

@override
String toString() {
  return 'MovieDetails(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsCopyWith<$Res>  {
  factory $MovieDetailsCopyWith(MovieDetails value, $Res Function(MovieDetails) _then) = _$MovieDetailsCopyWithImpl;
@useResult
$Res call({
 bool adult,@JsonKey(name: 'backdrop_path') String backdropPath,@JsonKey(name: 'belongs_to_collection') BelongsToCollection? belongsToCollection, int budget, List<MovieDetailsGenre> genres, String homepage, int id,@JsonKey(name: 'imdb_id') String imdbId,@JsonKey(name: 'origin_country') List<String> originCountry,@JsonKey(name: 'original_language') String originalLanguage,@JsonKey(name: 'original_title') String originalTitle, String overview, double popularity,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'production_companies') List<ProductionCompany> productionCompanies,@JsonKey(name: 'production_countries') List<ProductionCountry> productionCountries,@_DateTimeSerializer()@JsonKey(name: 'release_date') DateTime releaseDate, int revenue, int runtime,@JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages, String status, String tagline, String title, bool video,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount
});


$BelongsToCollectionCopyWith<$Res>? get belongsToCollection;

}
/// @nodoc
class _$MovieDetailsCopyWithImpl<$Res>
    implements $MovieDetailsCopyWith<$Res> {
  _$MovieDetailsCopyWithImpl(this._self, this._then);

  final MovieDetails _self;
  final $Res Function(MovieDetails) _then;

/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? backdropPath = null,Object? belongsToCollection = freezed,Object? budget = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? imdbId = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalTitle = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? productionCompanies = null,Object? productionCountries = null,Object? releaseDate = null,Object? revenue = null,Object? runtime = null,Object? spokenLanguages = null,Object? status = null,Object? tagline = null,Object? title = null,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,belongsToCollection: freezed == belongsToCollection ? _self.belongsToCollection : belongsToCollection // ignore: cast_nullable_to_non_nullable
as BelongsToCollection?,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<MovieDetailsGenre>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,productionCompanies: null == productionCompanies ? _self.productionCompanies : productionCompanies // ignore: cast_nullable_to_non_nullable
as List<ProductionCompany>,productionCountries: null == productionCountries ? _self.productionCountries : productionCountries // ignore: cast_nullable_to_non_nullable
as List<ProductionCountry>,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,spokenLanguages: null == spokenLanguages ? _self.spokenLanguages : spokenLanguages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BelongsToCollectionCopyWith<$Res>? get belongsToCollection {
    if (_self.belongsToCollection == null) {
    return null;
  }

  return $BelongsToCollectionCopyWith<$Res>(_self.belongsToCollection!, (value) {
    return _then(_self.copyWith(belongsToCollection: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieDetails].
extension MovieDetailsPatterns on MovieDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetails value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetails value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'belongs_to_collection')  BelongsToCollection? belongsToCollection,  int budget,  List<MovieDetailsGenre> genres,  String homepage,  int id, @JsonKey(name: 'imdb_id')  String imdbId, @JsonKey(name: 'origin_country')  List<String> originCountry, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'original_title')  String originalTitle,  String overview,  double popularity, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'production_companies')  List<ProductionCompany> productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry> productionCountries, @_DateTimeSerializer()@JsonKey(name: 'release_date')  DateTime releaseDate,  int revenue,  int runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage> spokenLanguages,  String status,  String tagline,  String title,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetails() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'belongs_to_collection')  BelongsToCollection? belongsToCollection,  int budget,  List<MovieDetailsGenre> genres,  String homepage,  int id, @JsonKey(name: 'imdb_id')  String imdbId, @JsonKey(name: 'origin_country')  List<String> originCountry, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'original_title')  String originalTitle,  String overview,  double popularity, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'production_companies')  List<ProductionCompany> productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry> productionCountries, @_DateTimeSerializer()@JsonKey(name: 'release_date')  DateTime releaseDate,  int revenue,  int runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage> spokenLanguages,  String status,  String tagline,  String title,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _MovieDetails():
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'belongs_to_collection')  BelongsToCollection? belongsToCollection,  int budget,  List<MovieDetailsGenre> genres,  String homepage,  int id, @JsonKey(name: 'imdb_id')  String imdbId, @JsonKey(name: 'origin_country')  List<String> originCountry, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'original_title')  String originalTitle,  String overview,  double popularity, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'production_companies')  List<ProductionCompany> productionCompanies, @JsonKey(name: 'production_countries')  List<ProductionCountry> productionCountries, @_DateTimeSerializer()@JsonKey(name: 'release_date')  DateTime releaseDate,  int revenue,  int runtime, @JsonKey(name: 'spoken_languages')  List<SpokenLanguage> spokenLanguages,  String status,  String tagline,  String title,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetails() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.belongsToCollection,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.productionCompanies,_that.productionCountries,_that.releaseDate,_that.revenue,_that.runtime,_that.spokenLanguages,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetails implements MovieDetails {
  const _MovieDetails({this.adult = false, @JsonKey(name: 'backdrop_path') this.backdropPath = '', @JsonKey(name: 'belongs_to_collection') this.belongsToCollection, this.budget = 0, final  List<MovieDetailsGenre> genres = const [], this.homepage = '', required this.id, @JsonKey(name: 'imdb_id') this.imdbId = '', @JsonKey(name: 'origin_country') final  List<String> originCountry = const [], @JsonKey(name: 'original_language') this.originalLanguage = '', @JsonKey(name: 'original_title') this.originalTitle = '', this.overview = '', this.popularity = 0.0, @JsonKey(name: 'poster_path') this.posterPath = '', @JsonKey(name: 'production_companies') final  List<ProductionCompany> productionCompanies = const [], @JsonKey(name: 'production_countries') final  List<ProductionCountry> productionCountries = const [], @_DateTimeSerializer()@JsonKey(name: 'release_date') required this.releaseDate, this.revenue = 0, this.runtime = 0, @JsonKey(name: 'spoken_languages') final  List<SpokenLanguage> spokenLanguages = const [], this.status = '', this.tagline = '', this.title = '', this.video = false, @JsonKey(name: 'vote_average') this.voteAverage = 0.0, @JsonKey(name: 'vote_count') this.voteCount = 0}): _genres = genres,_originCountry = originCountry,_productionCompanies = productionCompanies,_productionCountries = productionCountries,_spokenLanguages = spokenLanguages;
  factory _MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

@override@JsonKey() final  bool adult;
@override@JsonKey(name: 'backdrop_path') final  String backdropPath;
@override@JsonKey(name: 'belongs_to_collection') final  BelongsToCollection? belongsToCollection;
@override@JsonKey() final  int budget;
 final  List<MovieDetailsGenre> _genres;
@override@JsonKey() List<MovieDetailsGenre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override@JsonKey() final  String homepage;
@override final  int id;
@override@JsonKey(name: 'imdb_id') final  String imdbId;
 final  List<String> _originCountry;
@override@JsonKey(name: 'origin_country') List<String> get originCountry {
  if (_originCountry is EqualUnmodifiableListView) return _originCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originCountry);
}

@override@JsonKey(name: 'original_language') final  String originalLanguage;
@override@JsonKey(name: 'original_title') final  String originalTitle;
@override@JsonKey() final  String overview;
@override@JsonKey() final  double popularity;
@override@JsonKey(name: 'poster_path') final  String posterPath;
 final  List<ProductionCompany> _productionCompanies;
@override@JsonKey(name: 'production_companies') List<ProductionCompany> get productionCompanies {
  if (_productionCompanies is EqualUnmodifiableListView) return _productionCompanies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productionCompanies);
}

 final  List<ProductionCountry> _productionCountries;
@override@JsonKey(name: 'production_countries') List<ProductionCountry> get productionCountries {
  if (_productionCountries is EqualUnmodifiableListView) return _productionCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productionCountries);
}

@override@_DateTimeSerializer()@JsonKey(name: 'release_date') final  DateTime releaseDate;
@override@JsonKey() final  int revenue;
@override@JsonKey() final  int runtime;
 final  List<SpokenLanguage> _spokenLanguages;
@override@JsonKey(name: 'spoken_languages') List<SpokenLanguage> get spokenLanguages {
  if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_spokenLanguages);
}

@override@JsonKey() final  String status;
@override@JsonKey() final  String tagline;
@override@JsonKey() final  String title;
@override@JsonKey() final  bool video;
@override@JsonKey(name: 'vote_average') final  double voteAverage;
@override@JsonKey(name: 'vote_count') final  int voteCount;

/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsCopyWith<_MovieDetails> get copyWith => __$MovieDetailsCopyWithImpl<_MovieDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetails&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.belongsToCollection, belongsToCollection) || other.belongsToCollection == belongsToCollection)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other._productionCompanies, _productionCompanies)&&const DeepCollectionEquality().equals(other._productionCountries, _productionCountries)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other._spokenLanguages, _spokenLanguages)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,belongsToCollection,budget,const DeepCollectionEquality().hash(_genres),homepage,id,imdbId,const DeepCollectionEquality().hash(_originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,const DeepCollectionEquality().hash(_productionCompanies),const DeepCollectionEquality().hash(_productionCountries),releaseDate,revenue,runtime,const DeepCollectionEquality().hash(_spokenLanguages),status,tagline,title,video,voteAverage,voteCount]);

@override
String toString() {
  return 'MovieDetails(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsCopyWith<$Res> implements $MovieDetailsCopyWith<$Res> {
  factory _$MovieDetailsCopyWith(_MovieDetails value, $Res Function(_MovieDetails) _then) = __$MovieDetailsCopyWithImpl;
@override @useResult
$Res call({
 bool adult,@JsonKey(name: 'backdrop_path') String backdropPath,@JsonKey(name: 'belongs_to_collection') BelongsToCollection? belongsToCollection, int budget, List<MovieDetailsGenre> genres, String homepage, int id,@JsonKey(name: 'imdb_id') String imdbId,@JsonKey(name: 'origin_country') List<String> originCountry,@JsonKey(name: 'original_language') String originalLanguage,@JsonKey(name: 'original_title') String originalTitle, String overview, double popularity,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'production_companies') List<ProductionCompany> productionCompanies,@JsonKey(name: 'production_countries') List<ProductionCountry> productionCountries,@_DateTimeSerializer()@JsonKey(name: 'release_date') DateTime releaseDate, int revenue, int runtime,@JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages, String status, String tagline, String title, bool video,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount
});


@override $BelongsToCollectionCopyWith<$Res>? get belongsToCollection;

}
/// @nodoc
class __$MovieDetailsCopyWithImpl<$Res>
    implements _$MovieDetailsCopyWith<$Res> {
  __$MovieDetailsCopyWithImpl(this._self, this._then);

  final _MovieDetails _self;
  final $Res Function(_MovieDetails) _then;

/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? backdropPath = null,Object? belongsToCollection = freezed,Object? budget = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? imdbId = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalTitle = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? productionCompanies = null,Object? productionCountries = null,Object? releaseDate = null,Object? revenue = null,Object? runtime = null,Object? spokenLanguages = null,Object? status = null,Object? tagline = null,Object? title = null,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_MovieDetails(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,belongsToCollection: freezed == belongsToCollection ? _self.belongsToCollection : belongsToCollection // ignore: cast_nullable_to_non_nullable
as BelongsToCollection?,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<MovieDetailsGenre>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,productionCompanies: null == productionCompanies ? _self._productionCompanies : productionCompanies // ignore: cast_nullable_to_non_nullable
as List<ProductionCompany>,productionCountries: null == productionCountries ? _self._productionCountries : productionCountries // ignore: cast_nullable_to_non_nullable
as List<ProductionCountry>,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,spokenLanguages: null == spokenLanguages ? _self._spokenLanguages : spokenLanguages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MovieDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BelongsToCollectionCopyWith<$Res>? get belongsToCollection {
    if (_self.belongsToCollection == null) {
    return null;
  }

  return $BelongsToCollectionCopyWith<$Res>(_self.belongsToCollection!, (value) {
    return _then(_self.copyWith(belongsToCollection: value));
  });
}
}


/// @nodoc
mixin _$BelongsToCollection {

 int get id; String get name;@JsonKey(name: 'poster_path') String get posterPath;@JsonKey(name: 'backdrop_path') String get backdropPath;
/// Create a copy of BelongsToCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BelongsToCollectionCopyWith<BelongsToCollection> get copyWith => _$BelongsToCollectionCopyWithImpl<BelongsToCollection>(this as BelongsToCollection, _$identity);

  /// Serializes this BelongsToCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BelongsToCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,posterPath,backdropPath);

@override
String toString() {
  return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
}


}

/// @nodoc
abstract mixin class $BelongsToCollectionCopyWith<$Res>  {
  factory $BelongsToCollectionCopyWith(BelongsToCollection value, $Res Function(BelongsToCollection) _then) = _$BelongsToCollectionCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'backdrop_path') String backdropPath
});




}
/// @nodoc
class _$BelongsToCollectionCopyWithImpl<$Res>
    implements $BelongsToCollectionCopyWith<$Res> {
  _$BelongsToCollectionCopyWithImpl(this._self, this._then);

  final BelongsToCollection _self;
  final $Res Function(BelongsToCollection) _then;

/// Create a copy of BelongsToCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? posterPath = null,Object? backdropPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BelongsToCollection].
extension BelongsToCollectionPatterns on BelongsToCollection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BelongsToCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BelongsToCollection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BelongsToCollection value)  $default,){
final _that = this;
switch (_that) {
case _BelongsToCollection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BelongsToCollection value)?  $default,){
final _that = this;
switch (_that) {
case _BelongsToCollection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BelongsToCollection() when $default != null:
return $default(_that.id,_that.name,_that.posterPath,_that.backdropPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath)  $default,) {final _that = this;
switch (_that) {
case _BelongsToCollection():
return $default(_that.id,_that.name,_that.posterPath,_that.backdropPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath)?  $default,) {final _that = this;
switch (_that) {
case _BelongsToCollection() when $default != null:
return $default(_that.id,_that.name,_that.posterPath,_that.backdropPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BelongsToCollection implements BelongsToCollection {
  const _BelongsToCollection({required this.id, this.name = '', @JsonKey(name: 'poster_path') this.posterPath = '', @JsonKey(name: 'backdrop_path') this.backdropPath = ''});
  factory _BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'poster_path') final  String posterPath;
@override@JsonKey(name: 'backdrop_path') final  String backdropPath;

/// Create a copy of BelongsToCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BelongsToCollectionCopyWith<_BelongsToCollection> get copyWith => __$BelongsToCollectionCopyWithImpl<_BelongsToCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BelongsToCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BelongsToCollection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,posterPath,backdropPath);

@override
String toString() {
  return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
}


}

/// @nodoc
abstract mixin class _$BelongsToCollectionCopyWith<$Res> implements $BelongsToCollectionCopyWith<$Res> {
  factory _$BelongsToCollectionCopyWith(_BelongsToCollection value, $Res Function(_BelongsToCollection) _then) = __$BelongsToCollectionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'backdrop_path') String backdropPath
});




}
/// @nodoc
class __$BelongsToCollectionCopyWithImpl<$Res>
    implements _$BelongsToCollectionCopyWith<$Res> {
  __$BelongsToCollectionCopyWithImpl(this._self, this._then);

  final _BelongsToCollection _self;
  final $Res Function(_BelongsToCollection) _then;

/// Create a copy of BelongsToCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? posterPath = null,Object? backdropPath = null,}) {
  return _then(_BelongsToCollection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MovieDetailsGenre {

 int get id; String get name;
/// Create a copy of MovieDetailsGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsGenreCopyWith<MovieDetailsGenre> get copyWith => _$MovieDetailsGenreCopyWithImpl<MovieDetailsGenre>(this as MovieDetailsGenre, _$identity);

  /// Serializes this MovieDetailsGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MovieDetailsGenre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsGenreCopyWith<$Res>  {
  factory $MovieDetailsGenreCopyWith(MovieDetailsGenre value, $Res Function(MovieDetailsGenre) _then) = _$MovieDetailsGenreCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$MovieDetailsGenreCopyWithImpl<$Res>
    implements $MovieDetailsGenreCopyWith<$Res> {
  _$MovieDetailsGenreCopyWithImpl(this._self, this._then);

  final MovieDetailsGenre _self;
  final $Res Function(MovieDetailsGenre) _then;

/// Create a copy of MovieDetailsGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsGenre].
extension MovieDetailsGenrePatterns on MovieDetailsGenre {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailsGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailsGenre() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailsGenre value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsGenre():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailsGenre value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsGenre() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailsGenre() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsGenre():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsGenre() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetailsGenre implements MovieDetailsGenre {
  const _MovieDetailsGenre({required this.id, this.name = ''});
  factory _MovieDetailsGenre.fromJson(Map<String, dynamic> json) => _$MovieDetailsGenreFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;

/// Create a copy of MovieDetailsGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsGenreCopyWith<_MovieDetailsGenre> get copyWith => __$MovieDetailsGenreCopyWithImpl<_MovieDetailsGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailsGenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailsGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MovieDetailsGenre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsGenreCopyWith<$Res> implements $MovieDetailsGenreCopyWith<$Res> {
  factory _$MovieDetailsGenreCopyWith(_MovieDetailsGenre value, $Res Function(_MovieDetailsGenre) _then) = __$MovieDetailsGenreCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$MovieDetailsGenreCopyWithImpl<$Res>
    implements _$MovieDetailsGenreCopyWith<$Res> {
  __$MovieDetailsGenreCopyWithImpl(this._self, this._then);

  final _MovieDetailsGenre _self;
  final $Res Function(_MovieDetailsGenre) _then;

/// Create a copy of MovieDetailsGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_MovieDetailsGenre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductionCompany {

 int get id;@JsonKey(name: 'logo_path') String? get logoPath; String get name;@JsonKey(name: 'origin_country') String get originCountry;
/// Create a copy of ProductionCompany
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionCompanyCopyWith<ProductionCompany> get copyWith => _$ProductionCompanyCopyWithImpl<ProductionCompany>(this as ProductionCompany, _$identity);

  /// Serializes this ProductionCompany to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionCompany&&(identical(other.id, id) || other.id == id)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.name, name) || other.name == name)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logoPath,name,originCountry);

@override
String toString() {
  return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
}


}

/// @nodoc
abstract mixin class $ProductionCompanyCopyWith<$Res>  {
  factory $ProductionCompanyCopyWith(ProductionCompany value, $Res Function(ProductionCompany) _then) = _$ProductionCompanyCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'logo_path') String? logoPath, String name,@JsonKey(name: 'origin_country') String originCountry
});




}
/// @nodoc
class _$ProductionCompanyCopyWithImpl<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._self, this._then);

  final ProductionCompany _self;
  final $Res Function(ProductionCompany) _then;

/// Create a copy of ProductionCompany
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? logoPath = freezed,Object? name = null,Object? originCountry = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionCompany].
extension ProductionCompanyPatterns on ProductionCompany {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionCompany value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionCompany() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionCompany value)  $default,){
final _that = this;
switch (_that) {
case _ProductionCompany():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionCompany value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionCompany() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'logo_path')  String? logoPath,  String name, @JsonKey(name: 'origin_country')  String originCountry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionCompany() when $default != null:
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'logo_path')  String? logoPath,  String name, @JsonKey(name: 'origin_country')  String originCountry)  $default,) {final _that = this;
switch (_that) {
case _ProductionCompany():
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'logo_path')  String? logoPath,  String name, @JsonKey(name: 'origin_country')  String originCountry)?  $default,) {final _that = this;
switch (_that) {
case _ProductionCompany() when $default != null:
return $default(_that.id,_that.logoPath,_that.name,_that.originCountry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionCompany implements ProductionCompany {
  const _ProductionCompany({required this.id, @JsonKey(name: 'logo_path') this.logoPath, this.name = '', @JsonKey(name: 'origin_country') this.originCountry = ''});
  factory _ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

@override final  int id;
@override@JsonKey(name: 'logo_path') final  String? logoPath;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'origin_country') final  String originCountry;

/// Create a copy of ProductionCompany
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionCompanyCopyWith<_ProductionCompany> get copyWith => __$ProductionCompanyCopyWithImpl<_ProductionCompany>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionCompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionCompany&&(identical(other.id, id) || other.id == id)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.name, name) || other.name == name)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,logoPath,name,originCountry);

@override
String toString() {
  return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
}


}

/// @nodoc
abstract mixin class _$ProductionCompanyCopyWith<$Res> implements $ProductionCompanyCopyWith<$Res> {
  factory _$ProductionCompanyCopyWith(_ProductionCompany value, $Res Function(_ProductionCompany) _then) = __$ProductionCompanyCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'logo_path') String? logoPath, String name,@JsonKey(name: 'origin_country') String originCountry
});




}
/// @nodoc
class __$ProductionCompanyCopyWithImpl<$Res>
    implements _$ProductionCompanyCopyWith<$Res> {
  __$ProductionCompanyCopyWithImpl(this._self, this._then);

  final _ProductionCompany _self;
  final $Res Function(_ProductionCompany) _then;

/// Create a copy of ProductionCompany
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? logoPath = freezed,Object? name = null,Object? originCountry = null,}) {
  return _then(_ProductionCompany(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductionCountry {

@JsonKey(name: 'iso_3166_1') String get iso31661; String get name;
/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionCountryCopyWith<ProductionCountry> get copyWith => _$ProductionCountryCopyWithImpl<ProductionCountry>(this as ProductionCountry, _$identity);

  /// Serializes this ProductionCountry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionCountry&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso31661,name);

@override
String toString() {
  return 'ProductionCountry(iso31661: $iso31661, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProductionCountryCopyWith<$Res>  {
  factory $ProductionCountryCopyWith(ProductionCountry value, $Res Function(ProductionCountry) _then) = _$ProductionCountryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String iso31661, String name
});




}
/// @nodoc
class _$ProductionCountryCopyWithImpl<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._self, this._then);

  final ProductionCountry _self;
  final $Res Function(ProductionCountry) _then;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iso31661 = null,Object? name = null,}) {
  return _then(_self.copyWith(
iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionCountry].
extension ProductionCountryPatterns on ProductionCountry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionCountry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionCountry value)  $default,){
final _that = this;
switch (_that) {
case _ProductionCountry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionCountry value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String iso31661,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that.iso31661,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String iso31661,  String name)  $default,) {final _that = this;
switch (_that) {
case _ProductionCountry():
return $default(_that.iso31661,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'iso_3166_1')  String iso31661,  String name)?  $default,) {final _that = this;
switch (_that) {
case _ProductionCountry() when $default != null:
return $default(_that.iso31661,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionCountry implements ProductionCountry {
  const _ProductionCountry({@JsonKey(name: 'iso_3166_1') this.iso31661 = '', this.name = ''});
  factory _ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

@override@JsonKey(name: 'iso_3166_1') final  String iso31661;
@override@JsonKey() final  String name;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionCountryCopyWith<_ProductionCountry> get copyWith => __$ProductionCountryCopyWithImpl<_ProductionCountry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionCountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionCountry&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iso31661,name);

@override
String toString() {
  return 'ProductionCountry(iso31661: $iso31661, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProductionCountryCopyWith<$Res> implements $ProductionCountryCopyWith<$Res> {
  factory _$ProductionCountryCopyWith(_ProductionCountry value, $Res Function(_ProductionCountry) _then) = __$ProductionCountryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String iso31661, String name
});




}
/// @nodoc
class __$ProductionCountryCopyWithImpl<$Res>
    implements _$ProductionCountryCopyWith<$Res> {
  __$ProductionCountryCopyWithImpl(this._self, this._then);

  final _ProductionCountry _self;
  final $Res Function(_ProductionCountry) _then;

/// Create a copy of ProductionCountry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iso31661 = null,Object? name = null,}) {
  return _then(_ProductionCountry(
iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpokenLanguage {

@JsonKey(name: 'english_name') String get englishName;@JsonKey(name: 'iso_639_1') String get iso6391; String get name;
/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpokenLanguageCopyWith<SpokenLanguage> get copyWith => _$SpokenLanguageCopyWithImpl<SpokenLanguage>(this as SpokenLanguage, _$identity);

  /// Serializes this SpokenLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpokenLanguage&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishName,iso6391,name);

@override
String toString() {
  return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
}


}

/// @nodoc
abstract mixin class $SpokenLanguageCopyWith<$Res>  {
  factory $SpokenLanguageCopyWith(SpokenLanguage value, $Res Function(SpokenLanguage) _then) = _$SpokenLanguageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'english_name') String englishName,@JsonKey(name: 'iso_639_1') String iso6391, String name
});




}
/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._self, this._then);

  final SpokenLanguage _self;
  final $Res Function(SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? englishName = null,Object? iso6391 = null,Object? name = null,}) {
  return _then(_self.copyWith(
englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpokenLanguage].
extension SpokenLanguagePatterns on SpokenLanguage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpokenLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpokenLanguage value)  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpokenLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'english_name')  String englishName, @JsonKey(name: 'iso_639_1')  String iso6391,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.englishName,_that.iso6391,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'english_name')  String englishName, @JsonKey(name: 'iso_639_1')  String iso6391,  String name)  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage():
return $default(_that.englishName,_that.iso6391,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'english_name')  String englishName, @JsonKey(name: 'iso_639_1')  String iso6391,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.englishName,_that.iso6391,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpokenLanguage implements SpokenLanguage {
  const _SpokenLanguage({@JsonKey(name: 'english_name') this.englishName = '', @JsonKey(name: 'iso_639_1') this.iso6391 = '', this.name = ''});
  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

@override@JsonKey(name: 'english_name') final  String englishName;
@override@JsonKey(name: 'iso_639_1') final  String iso6391;
@override@JsonKey() final  String name;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith => __$SpokenLanguageCopyWithImpl<_SpokenLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpokenLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpokenLanguage&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishName,iso6391,name);

@override
String toString() {
  return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SpokenLanguageCopyWith<$Res> implements $SpokenLanguageCopyWith<$Res> {
  factory _$SpokenLanguageCopyWith(_SpokenLanguage value, $Res Function(_SpokenLanguage) _then) = __$SpokenLanguageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'english_name') String englishName,@JsonKey(name: 'iso_639_1') String iso6391, String name
});




}
/// @nodoc
class __$SpokenLanguageCopyWithImpl<$Res>
    implements _$SpokenLanguageCopyWith<$Res> {
  __$SpokenLanguageCopyWithImpl(this._self, this._then);

  final _SpokenLanguage _self;
  final $Res Function(_SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? englishName = null,Object? iso6391 = null,Object? name = null,}) {
  return _then(_SpokenLanguage(
englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
