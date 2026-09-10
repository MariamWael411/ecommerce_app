// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogery_brand_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatogeryBrandResponceDto _$CatogeryBrandResponceDtoFromJson(
  Map<String, dynamic> json,
) => CatogeryBrandResponceDto(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CatogeryBrandDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CatogeryBrandResponceDtoToJson(
  CatogeryBrandResponceDto instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
