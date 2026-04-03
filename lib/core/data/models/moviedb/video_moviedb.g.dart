// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_moviedb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoMovieDB _$VideoMovieDBFromJson(Map<String, dynamic> json) =>
    _VideoMovieDB(
      id: json['id'] as String? ?? '',
      iso6391: json['iso_639_1'] as String? ?? '',
      iso31661: json['iso_3166_1'] as String? ?? '',
      key: json['key'] as String? ?? '',
      name: json['name'] as String? ?? '',
      site: json['site'] as String? ?? '',
      size: (json['size'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      official: json['official'] as bool? ?? false,
      publishedAt: json['published_at'] as String? ?? '',
    );

Map<String, dynamic> _$VideoMovieDBToJson(_VideoMovieDB instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
    };
