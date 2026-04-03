// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_moviedb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoMovieDB {

 String get id;@JsonKey(name: 'iso_639_1') String get iso6391;@JsonKey(name: 'iso_3166_1') String get iso31661; String get key; String get name; String get site; int get size; String get type; bool get official;@JsonKey(name: 'published_at') String get publishedAt;
/// Create a copy of VideoMovieDB
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoMovieDBCopyWith<VideoMovieDB> get copyWith => _$VideoMovieDBCopyWithImpl<VideoMovieDB>(this as VideoMovieDB, _$identity);

  /// Serializes this VideoMovieDB to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoMovieDB&&(identical(other.id, id) || other.id == id)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.site, site) || other.site == site)&&(identical(other.size, size) || other.size == size)&&(identical(other.type, type) || other.type == type)&&(identical(other.official, official) || other.official == official)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iso6391,iso31661,key,name,site,size,type,official,publishedAt);

@override
String toString() {
  return 'VideoMovieDB(id: $id, iso6391: $iso6391, iso31661: $iso31661, key: $key, name: $name, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class $VideoMovieDBCopyWith<$Res>  {
  factory $VideoMovieDBCopyWith(VideoMovieDB value, $Res Function(VideoMovieDB) _then) = _$VideoMovieDBCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'iso_639_1') String iso6391,@JsonKey(name: 'iso_3166_1') String iso31661, String key, String name, String site, int size, String type, bool official,@JsonKey(name: 'published_at') String publishedAt
});




}
/// @nodoc
class _$VideoMovieDBCopyWithImpl<$Res>
    implements $VideoMovieDBCopyWith<$Res> {
  _$VideoMovieDBCopyWithImpl(this._self, this._then);

  final VideoMovieDB _self;
  final $Res Function(VideoMovieDB) _then;

/// Create a copy of VideoMovieDB
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? iso6391 = null,Object? iso31661 = null,Object? key = null,Object? name = null,Object? site = null,Object? size = null,Object? type = null,Object? official = null,Object? publishedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoMovieDB].
extension VideoMovieDBPatterns on VideoMovieDB {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoMovieDB value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoMovieDB() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoMovieDB value)  $default,){
final _that = this;
switch (_that) {
case _VideoMovieDB():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoMovieDB value)?  $default,){
final _that = this;
switch (_that) {
case _VideoMovieDB() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iso_639_1')  String iso6391, @JsonKey(name: 'iso_3166_1')  String iso31661,  String key,  String name,  String site,  int size,  String type,  bool official, @JsonKey(name: 'published_at')  String publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoMovieDB() when $default != null:
return $default(_that.id,_that.iso6391,_that.iso31661,_that.key,_that.name,_that.site,_that.size,_that.type,_that.official,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'iso_639_1')  String iso6391, @JsonKey(name: 'iso_3166_1')  String iso31661,  String key,  String name,  String site,  int size,  String type,  bool official, @JsonKey(name: 'published_at')  String publishedAt)  $default,) {final _that = this;
switch (_that) {
case _VideoMovieDB():
return $default(_that.id,_that.iso6391,_that.iso31661,_that.key,_that.name,_that.site,_that.size,_that.type,_that.official,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'iso_639_1')  String iso6391, @JsonKey(name: 'iso_3166_1')  String iso31661,  String key,  String name,  String site,  int size,  String type,  bool official, @JsonKey(name: 'published_at')  String publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _VideoMovieDB() when $default != null:
return $default(_that.id,_that.iso6391,_that.iso31661,_that.key,_that.name,_that.site,_that.size,_that.type,_that.official,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoMovieDB implements VideoMovieDB {
  const _VideoMovieDB({this.id = '', @JsonKey(name: 'iso_639_1') this.iso6391 = '', @JsonKey(name: 'iso_3166_1') this.iso31661 = '', this.key = '', this.name = '', this.site = '', this.size = 0, this.type = '', this.official = false, @JsonKey(name: 'published_at') this.publishedAt = ''});
  factory _VideoMovieDB.fromJson(Map<String, dynamic> json) => _$VideoMovieDBFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'iso_639_1') final  String iso6391;
@override@JsonKey(name: 'iso_3166_1') final  String iso31661;
@override@JsonKey() final  String key;
@override@JsonKey() final  String name;
@override@JsonKey() final  String site;
@override@JsonKey() final  int size;
@override@JsonKey() final  String type;
@override@JsonKey() final  bool official;
@override@JsonKey(name: 'published_at') final  String publishedAt;

/// Create a copy of VideoMovieDB
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoMovieDBCopyWith<_VideoMovieDB> get copyWith => __$VideoMovieDBCopyWithImpl<_VideoMovieDB>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoMovieDBToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoMovieDB&&(identical(other.id, id) || other.id == id)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.site, site) || other.site == site)&&(identical(other.size, size) || other.size == size)&&(identical(other.type, type) || other.type == type)&&(identical(other.official, official) || other.official == official)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iso6391,iso31661,key,name,site,size,type,official,publishedAt);

@override
String toString() {
  return 'VideoMovieDB(id: $id, iso6391: $iso6391, iso31661: $iso31661, key: $key, name: $name, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$VideoMovieDBCopyWith<$Res> implements $VideoMovieDBCopyWith<$Res> {
  factory _$VideoMovieDBCopyWith(_VideoMovieDB value, $Res Function(_VideoMovieDB) _then) = __$VideoMovieDBCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'iso_639_1') String iso6391,@JsonKey(name: 'iso_3166_1') String iso31661, String key, String name, String site, int size, String type, bool official,@JsonKey(name: 'published_at') String publishedAt
});




}
/// @nodoc
class __$VideoMovieDBCopyWithImpl<$Res>
    implements _$VideoMovieDBCopyWith<$Res> {
  __$VideoMovieDBCopyWithImpl(this._self, this._then);

  final _VideoMovieDB _self;
  final $Res Function(_VideoMovieDB) _then;

/// Create a copy of VideoMovieDB
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? iso6391 = null,Object? iso31661 = null,Object? key = null,Object? name = null,Object? site = null,Object? size = null,Object? type = null,Object? official = null,Object? publishedAt = null,}) {
  return _then(_VideoMovieDB(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
