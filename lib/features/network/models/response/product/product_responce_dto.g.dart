// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponceDto _$ProductResponceDtoFromJson(Map<String, dynamic> json) =>
    ProductResponceDto(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponceDtoToJson(ProductResponceDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
