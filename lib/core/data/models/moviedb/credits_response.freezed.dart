// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credits_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditsResponse {

 int get id; List<Cast> get cast; List<Cast> get crew;
/// Create a copy of CreditsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditsResponseCopyWith<CreditsResponse> get copyWith => _$CreditsResponseCopyWithImpl<CreditsResponse>(this as CreditsResponse, _$identity);

  /// Serializes this CreditsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditsResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.cast, cast)&&const DeepCollectionEquality().equals(other.crew, crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(cast),const DeepCollectionEquality().hash(crew));

@override
String toString() {
  return 'CreditsResponse(id: $id, cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class $CreditsResponseCopyWith<$Res>  {
  factory $CreditsResponseCopyWith(CreditsResponse value, $Res Function(CreditsResponse) _then) = _$CreditsResponseCopyWithImpl;
@useResult
$Res call({
 int id, List<Cast> cast, List<Cast> crew
});




}
/// @nodoc
class _$CreditsResponseCopyWithImpl<$Res>
    implements $CreditsResponseCopyWith<$Res> {
  _$CreditsResponseCopyWithImpl(this._self, this._then);

  final CreditsResponse _self;
  final $Res Function(CreditsResponse) _then;

/// Create a copy of CreditsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cast = null,Object? crew = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<Cast>,crew: null == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<Cast>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditsResponse].
extension CreditsResponsePatterns on CreditsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreditsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreditsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<Cast> cast,  List<Cast> crew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditsResponse() when $default != null:
return $default(_that.id,_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<Cast> cast,  List<Cast> crew)  $default,) {final _that = this;
switch (_that) {
case _CreditsResponse():
return $default(_that.id,_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<Cast> cast,  List<Cast> crew)?  $default,) {final _that = this;
switch (_that) {
case _CreditsResponse() when $default != null:
return $default(_that.id,_that.cast,_that.crew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditsResponse implements CreditsResponse {
  const _CreditsResponse({required this.id, final  List<Cast> cast = const [], final  List<Cast> crew = const []}): _cast = cast,_crew = crew;
  factory _CreditsResponse.fromJson(Map<String, dynamic> json) => _$CreditsResponseFromJson(json);

@override final  int id;
 final  List<Cast> _cast;
@override@JsonKey() List<Cast> get cast {
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cast);
}

 final  List<Cast> _crew;
@override@JsonKey() List<Cast> get crew {
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crew);
}


/// Create a copy of CreditsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditsResponseCopyWith<_CreditsResponse> get copyWith => __$CreditsResponseCopyWithImpl<_CreditsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditsResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._cast, _cast)&&const DeepCollectionEquality().equals(other._crew, _crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_cast),const DeepCollectionEquality().hash(_crew));

@override
String toString() {
  return 'CreditsResponse(id: $id, cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class _$CreditsResponseCopyWith<$Res> implements $CreditsResponseCopyWith<$Res> {
  factory _$CreditsResponseCopyWith(_CreditsResponse value, $Res Function(_CreditsResponse) _then) = __$CreditsResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, List<Cast> cast, List<Cast> crew
});




}
/// @nodoc
class __$CreditsResponseCopyWithImpl<$Res>
    implements _$CreditsResponseCopyWith<$Res> {
  __$CreditsResponseCopyWithImpl(this._self, this._then);

  final _CreditsResponse _self;
  final $Res Function(_CreditsResponse) _then;

/// Create a copy of CreditsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cast = null,Object? crew = null,}) {
  return _then(_CreditsResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<Cast>,crew: null == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<Cast>,
  ));
}


}


/// @nodoc
mixin _$Cast {

 bool get adult; int get gender; int get id;@JsonKey(name: 'known_for_department') String? get knownForDepartment; String get name;@JsonKey(name: 'original_name') String get originalName; double get popularity;@JsonKey(name: 'profile_path') String? get profilePath;@JsonKey(name: 'cast_id') int? get castId; String? get character;@JsonKey(name: 'credit_id') String get creditId; int? get order; String? get department; String? get job;
/// Create a copy of Cast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastCopyWith<Cast> get copyWith => _$CastCopyWithImpl<Cast>(this as Cast, _$identity);

  /// Serializes this Cast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cast&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.castId, castId) || other.castId == castId)&&(identical(other.character, character) || other.character == character)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.order, order) || other.order == order)&&(identical(other.department, department) || other.department == department)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,castId,character,creditId,order,department,job);

@override
String toString() {
  return 'Cast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order, department: $department, job: $job)';
}


}

/// @nodoc
abstract mixin class $CastCopyWith<$Res>  {
  factory $CastCopyWith(Cast value, $Res Function(Cast) _then) = _$CastCopyWithImpl;
@useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: 'known_for_department') String? knownForDepartment, String name,@JsonKey(name: 'original_name') String originalName, double popularity,@JsonKey(name: 'profile_path') String? profilePath,@JsonKey(name: 'cast_id') int? castId, String? character,@JsonKey(name: 'credit_id') String creditId, int? order, String? department, String? job
});




}
/// @nodoc
class _$CastCopyWithImpl<$Res>
    implements $CastCopyWith<$Res> {
  _$CastCopyWithImpl(this._self, this._then);

  final Cast _self;
  final $Res Function(Cast) _then;

/// Create a copy of Cast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = null,Object? originalName = null,Object? popularity = null,Object? profilePath = freezed,Object? castId = freezed,Object? character = freezed,Object? creditId = null,Object? order = freezed,Object? department = freezed,Object? job = freezed,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: freezed == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: null == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cast].
extension CastPatterns on Cast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cast value)  $default,){
final _that = this;
switch (_that) {
case _Cast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cast value)?  $default,){
final _that = this;
switch (_that) {
case _Cast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String name, @JsonKey(name: 'original_name')  String originalName,  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId,  String? character, @JsonKey(name: 'credit_id')  String creditId,  int? order,  String? department,  String? job)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.department,_that.job);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  int gender,  int id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String name, @JsonKey(name: 'original_name')  String originalName,  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId,  String? character, @JsonKey(name: 'credit_id')  String creditId,  int? order,  String? department,  String? job)  $default,) {final _that = this;
switch (_that) {
case _Cast():
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.department,_that.job);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  int gender,  int id, @JsonKey(name: 'known_for_department')  String? knownForDepartment,  String name, @JsonKey(name: 'original_name')  String originalName,  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId,  String? character, @JsonKey(name: 'credit_id')  String creditId,  int? order,  String? department,  String? job)?  $default,) {final _that = this;
switch (_that) {
case _Cast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.knownForDepartment,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.department,_that.job);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cast implements Cast {
  const _Cast({this.adult = false, this.gender = 0, required this.id, @JsonKey(name: 'known_for_department') this.knownForDepartment, this.name = '', @JsonKey(name: 'original_name') this.originalName = '', this.popularity = 0.0, @JsonKey(name: 'profile_path') this.profilePath, @JsonKey(name: 'cast_id') this.castId, this.character, @JsonKey(name: 'credit_id') this.creditId = '', this.order, this.department, this.job});
  factory _Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

@override@JsonKey() final  bool adult;
@override@JsonKey() final  int gender;
@override final  int id;
@override@JsonKey(name: 'known_for_department') final  String? knownForDepartment;
@override@JsonKey() final  String name;
@override@JsonKey(name: 'original_name') final  String originalName;
@override@JsonKey() final  double popularity;
@override@JsonKey(name: 'profile_path') final  String? profilePath;
@override@JsonKey(name: 'cast_id') final  int? castId;
@override final  String? character;
@override@JsonKey(name: 'credit_id') final  String creditId;
@override final  int? order;
@override final  String? department;
@override final  String? job;

/// Create a copy of Cast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CastCopyWith<_Cast> get copyWith => __$CastCopyWithImpl<_Cast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cast&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.knownForDepartment, knownForDepartment) || other.knownForDepartment == knownForDepartment)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.castId, castId) || other.castId == castId)&&(identical(other.character, character) || other.character == character)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.order, order) || other.order == order)&&(identical(other.department, department) || other.department == department)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,gender,id,knownForDepartment,name,originalName,popularity,profilePath,castId,character,creditId,order,department,job);

@override
String toString() {
  return 'Cast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order, department: $department, job: $job)';
}


}

/// @nodoc
abstract mixin class _$CastCopyWith<$Res> implements $CastCopyWith<$Res> {
  factory _$CastCopyWith(_Cast value, $Res Function(_Cast) _then) = __$CastCopyWithImpl;
@override @useResult
$Res call({
 bool adult, int gender, int id,@JsonKey(name: 'known_for_department') String? knownForDepartment, String name,@JsonKey(name: 'original_name') String originalName, double popularity,@JsonKey(name: 'profile_path') String? profilePath,@JsonKey(name: 'cast_id') int? castId, String? character,@JsonKey(name: 'credit_id') String creditId, int? order, String? department, String? job
});




}
/// @nodoc
class __$CastCopyWithImpl<$Res>
    implements _$CastCopyWith<$Res> {
  __$CastCopyWithImpl(this._self, this._then);

  final _Cast _self;
  final $Res Function(_Cast) _then;

/// Create a copy of Cast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? knownForDepartment = freezed,Object? name = null,Object? originalName = null,Object? popularity = null,Object? profilePath = freezed,Object? castId = freezed,Object? character = freezed,Object? creditId = null,Object? order = freezed,Object? department = freezed,Object? job = freezed,}) {
  return _then(_Cast(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,knownForDepartment: freezed == knownForDepartment ? _self.knownForDepartment : knownForDepartment // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: freezed == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: null == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
