// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moviedb_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDbResponse {

 Dates? get dates; int get page; List<MovieMovieDB> get results;@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'total_results') int get totalResults;
/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDbResponseCopyWith<MovieDbResponse> get copyWith => _$MovieDbResponseCopyWithImpl<MovieDbResponse>(this as MovieDbResponse, _$identity);

  /// Serializes this MovieDbResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDbResponse&&(identical(other.dates, dates) || other.dates == dates)&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dates,page,const DeepCollectionEquality().hash(results),totalPages,totalResults);

@override
String toString() {
  return 'MovieDbResponse(dates: $dates, page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
}


}

/// @nodoc
abstract mixin class $MovieDbResponseCopyWith<$Res>  {
  factory $MovieDbResponseCopyWith(MovieDbResponse value, $Res Function(MovieDbResponse) _then) = _$MovieDbResponseCopyWithImpl;
@useResult
$Res call({
 Dates? dates, int page, List<MovieMovieDB> results,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'total_results') int totalResults
});


$DatesCopyWith<$Res>? get dates;

}
/// @nodoc
class _$MovieDbResponseCopyWithImpl<$Res>
    implements $MovieDbResponseCopyWith<$Res> {
  _$MovieDbResponseCopyWithImpl(this._self, this._then);

  final MovieDbResponse _self;
  final $Res Function(MovieDbResponse) _then;

/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dates = freezed,Object? page = null,Object? results = null,Object? totalPages = null,Object? totalResults = null,}) {
  return _then(_self.copyWith(
dates: freezed == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as Dates?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<MovieMovieDB>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatesCopyWith<$Res>? get dates {
    if (_self.dates == null) {
    return null;
  }

  return $DatesCopyWith<$Res>(_self.dates!, (value) {
    return _then(_self.copyWith(dates: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieDbResponse].
extension MovieDbResponsePatterns on MovieDbResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDbResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDbResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDbResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieDbResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDbResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDbResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Dates? dates,  int page,  List<MovieMovieDB> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDbResponse() when $default != null:
return $default(_that.dates,_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Dates? dates,  int page,  List<MovieMovieDB> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)  $default,) {final _that = this;
switch (_that) {
case _MovieDbResponse():
return $default(_that.dates,_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Dates? dates,  int page,  List<MovieMovieDB> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)?  $default,) {final _that = this;
switch (_that) {
case _MovieDbResponse() when $default != null:
return $default(_that.dates,_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDbResponse implements MovieDbResponse {
  const _MovieDbResponse({this.dates, this.page = 0, final  List<MovieMovieDB> results = const [], @JsonKey(name: 'total_pages') this.totalPages = 0, @JsonKey(name: 'total_results') this.totalResults = 0}): _results = results;
  factory _MovieDbResponse.fromJson(Map<String, dynamic> json) => _$MovieDbResponseFromJson(json);

@override final  Dates? dates;
@override@JsonKey() final  int page;
 final  List<MovieMovieDB> _results;
@override@JsonKey() List<MovieMovieDB> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey(name: 'total_pages') final  int totalPages;
@override@JsonKey(name: 'total_results') final  int totalResults;

/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDbResponseCopyWith<_MovieDbResponse> get copyWith => __$MovieDbResponseCopyWithImpl<_MovieDbResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDbResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDbResponse&&(identical(other.dates, dates) || other.dates == dates)&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dates,page,const DeepCollectionEquality().hash(_results),totalPages,totalResults);

@override
String toString() {
  return 'MovieDbResponse(dates: $dates, page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
}


}

/// @nodoc
abstract mixin class _$MovieDbResponseCopyWith<$Res> implements $MovieDbResponseCopyWith<$Res> {
  factory _$MovieDbResponseCopyWith(_MovieDbResponse value, $Res Function(_MovieDbResponse) _then) = __$MovieDbResponseCopyWithImpl;
@override @useResult
$Res call({
 Dates? dates, int page, List<MovieMovieDB> results,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'total_results') int totalResults
});


@override $DatesCopyWith<$Res>? get dates;

}
/// @nodoc
class __$MovieDbResponseCopyWithImpl<$Res>
    implements _$MovieDbResponseCopyWith<$Res> {
  __$MovieDbResponseCopyWithImpl(this._self, this._then);

  final _MovieDbResponse _self;
  final $Res Function(_MovieDbResponse) _then;

/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dates = freezed,Object? page = null,Object? results = null,Object? totalPages = null,Object? totalResults = null,}) {
  return _then(_MovieDbResponse(
dates: freezed == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as Dates?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<MovieMovieDB>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MovieDbResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DatesCopyWith<$Res>? get dates {
    if (_self.dates == null) {
    return null;
  }

  return $DatesCopyWith<$Res>(_self.dates!, (value) {
    return _then(_self.copyWith(dates: value));
  });
}
}


/// @nodoc
mixin _$Dates {

 DateTime get maximum; DateTime get minimum;
/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatesCopyWith<Dates> get copyWith => _$DatesCopyWithImpl<Dates>(this as Dates, _$identity);

  /// Serializes this Dates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dates&&(identical(other.maximum, maximum) || other.maximum == maximum)&&(identical(other.minimum, minimum) || other.minimum == minimum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maximum,minimum);

@override
String toString() {
  return 'Dates(maximum: $maximum, minimum: $minimum)';
}


}

/// @nodoc
abstract mixin class $DatesCopyWith<$Res>  {
  factory $DatesCopyWith(Dates value, $Res Function(Dates) _then) = _$DatesCopyWithImpl;
@useResult
$Res call({
 DateTime maximum, DateTime minimum
});




}
/// @nodoc
class _$DatesCopyWithImpl<$Res>
    implements $DatesCopyWith<$Res> {
  _$DatesCopyWithImpl(this._self, this._then);

  final Dates _self;
  final $Res Function(Dates) _then;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maximum = null,Object? minimum = null,}) {
  return _then(_self.copyWith(
maximum: null == maximum ? _self.maximum : maximum // ignore: cast_nullable_to_non_nullable
as DateTime,minimum: null == minimum ? _self.minimum : minimum // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Dates].
extension DatesPatterns on Dates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dates() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dates value)  $default,){
final _that = this;
switch (_that) {
case _Dates():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dates value)?  $default,){
final _that = this;
switch (_that) {
case _Dates() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime maximum,  DateTime minimum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dates() when $default != null:
return $default(_that.maximum,_that.minimum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime maximum,  DateTime minimum)  $default,) {final _that = this;
switch (_that) {
case _Dates():
return $default(_that.maximum,_that.minimum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime maximum,  DateTime minimum)?  $default,) {final _that = this;
switch (_that) {
case _Dates() when $default != null:
return $default(_that.maximum,_that.minimum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dates implements Dates {
  const _Dates({required this.maximum, required this.minimum});
  factory _Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

@override final  DateTime maximum;
@override final  DateTime minimum;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatesCopyWith<_Dates> get copyWith => __$DatesCopyWithImpl<_Dates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dates&&(identical(other.maximum, maximum) || other.maximum == maximum)&&(identical(other.minimum, minimum) || other.minimum == minimum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maximum,minimum);

@override
String toString() {
  return 'Dates(maximum: $maximum, minimum: $minimum)';
}


}

/// @nodoc
abstract mixin class _$DatesCopyWith<$Res> implements $DatesCopyWith<$Res> {
  factory _$DatesCopyWith(_Dates value, $Res Function(_Dates) _then) = __$DatesCopyWithImpl;
@override @useResult
$Res call({
 DateTime maximum, DateTime minimum
});




}
/// @nodoc
class __$DatesCopyWithImpl<$Res>
    implements _$DatesCopyWith<$Res> {
  __$DatesCopyWithImpl(this._self, this._then);

  final _Dates _self;
  final $Res Function(_Dates) _then;

/// Create a copy of Dates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maximum = null,Object? minimum = null,}) {
  return _then(_Dates(
maximum: null == maximum ? _self.maximum : maximum // ignore: cast_nullable_to_non_nullable
as DateTime,minimum: null == minimum ? _self.minimum : minimum // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
