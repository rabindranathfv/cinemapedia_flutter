// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_moviedb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenreMovieDB _$GenreMovieDBFromJson(Map<String, dynamic> json) =>
    _GenreMovieDB(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GenreMovieDBToJson(_GenreMovieDB instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
