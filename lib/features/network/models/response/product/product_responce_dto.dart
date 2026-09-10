import 'package:ecommerce/features/network/models/response/common/meta_data_dto.dart';
import 'package:ecommerce/features/network/models/response/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_responce_dto.g.dart';

@JsonSerializable()
class ProductResponceDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductResponceDto({this.results, this.metadata, this.data});

  factory ProductResponceDto.fromJson(Map<String, dynamic> json) {
    return _$ProductResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductResponceDtoToJson(this);
  }
}
