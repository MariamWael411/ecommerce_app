// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catogrey_brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatogeryBrandDto _$CatogeryBrandDtoFromJson(Map<String, dynamic> json) =>
    CatogeryBrandDto(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$CatogeryBrandDtoToJson(CatogeryBrandDto instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
    };
