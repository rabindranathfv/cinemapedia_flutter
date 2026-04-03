// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviedb_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDbResponse _$MovieDbResponseFromJson(Map<String, dynamic> json) =>
    _MovieDbResponse(
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      page: (json['page'] as num?)?.toInt() ?? 0,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => MovieMovieDB.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
      totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MovieDbResponseToJson(_MovieDbResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

_Dates _$DatesFromJson(Map<String, dynamic> json) => _Dates(
  maximum: DateTime.parse(json['maximum'] as String),
  minimum: DateTime.parse(json['minimum'] as String),
);

Map<String, dynamic> _$DatesToJson(_Dates instance) => <String, dynamic>{
  'maximum': instance.maximum.toIso8601String(),
  'minimum': instance.minimum.toIso8601String(),
};
