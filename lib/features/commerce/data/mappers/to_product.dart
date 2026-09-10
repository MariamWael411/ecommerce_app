import 'package:ecommerce/features/commerce/data/mappers/to_category_brand.dart';
import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:ecommerce/features/network/models/response/product/product_dto.dart';

extension ToProduct on ProductDto {
  Product toProduct() {
    return Product(
      category: category?.toCategoryBrand(),
      title: title,
      id: id,
      description: description,
      brand: brand?.toCategoryBrand(),
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory?.toCategoryBrandList(),
    );
  }
}

extension ToProductList on List<ProductDto> {
  List<Product> toProductList() {
    return map((dto) => dto.toProduct()).toList();
  }
}
