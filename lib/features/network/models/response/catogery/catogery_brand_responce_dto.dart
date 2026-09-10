import 'package:ecommerce/features/network/models/response/common/catogrey_brand_dto.dart';
import 'package:ecommerce/features/network/models/response/common/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catogery_brand_responce_dto.g.dart';

@JsonSerializable()
class CatogeryBrandResponceDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<CatogeryBrandDto>? data;

  CatogeryBrandResponceDto({this.results, this.metadata, this.data});

  factory CatogeryBrandResponceDto.fromJson(Map<String, dynamic> json) {
    return _$CatogeryBrandResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CatogeryBrandResponceDtoToJson(this);
  }
}
