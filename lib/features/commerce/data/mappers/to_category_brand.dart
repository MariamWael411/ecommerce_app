import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';
import 'package:ecommerce/features/network/models/response/common/catogrey_brand_dto.dart';

extension ToCategoryBrand on CatogeryBrandDto {
  CatogeryBrand toCategoryBrand() {
    return CatogeryBrand(
      name: name,
      image: image,
      category: category,
      Id: Id,
      slug: slug,
    );
  }
}

extension ToCategoryBrandList on List<CatogeryBrandDto> {
  List<CatogeryBrand> toCategoryBrandList() {
    return map((dto) => dto.toCategoryBrand()).toList();
  }
}
