// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditsResponse _$CreditsResponseFromJson(Map<String, dynamic> json) =>
    _CreditsResponse(
      id: (json['id'] as num).toInt(),
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      crew:
          (json['crew'] as List<dynamic>?)
              ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CreditsResponseToJson(_CreditsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

_Cast _$CastFromJson(Map<String, dynamic> json) => _Cast(
  adult: json['adult'] as bool? ?? false,
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  id: (json['id'] as num).toInt(),
  knownForDepartment: json['known_for_department'] as String?,
  name: json['name'] as String? ?? '',
  originalName: json['original_name'] as String? ?? '',
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
  profilePath: json['profile_path'] as String?,
  castId: (json['cast_id'] as num?)?.toInt(),
  character: json['character'] as String?,
  creditId: json['credit_id'] as String? ?? '',
  order: (json['order'] as num?)?.toInt(),
  department: json['department'] as String?,
  job: json['job'] as String?,
);

Map<String, dynamic> _$CastToJson(_Cast instance) => <String, dynamic>{
  'adult': instance.adult,
  'gender': instance.gender,
  'id': instance.id,
  'known_for_department': instance.knownForDepartment,
  'name': instance.name,
  'original_name': instance.originalName,
  'popularity': instance.popularity,
  'profile_path': instance.profilePath,
  'cast_id': instance.castId,
  'character': instance.character,
  'credit_id': instance.creditId,
  'order': instance.order,
  'department': instance.department,
  'job': instance.job,
};
