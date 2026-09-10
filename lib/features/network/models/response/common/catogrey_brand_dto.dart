import 'package:json_annotation/json_annotation.dart';

part 'catogrey_brand_dto.g.dart';

@JsonSerializable()
class CatogeryBrandDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "category")
  final String? category;

  CatogeryBrandDto({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory CatogeryBrandDto.fromJson(Map<String, dynamic> json) {
    return _$CatogeryBrandDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CatogeryBrandDtoToJson(this);
  }
}
