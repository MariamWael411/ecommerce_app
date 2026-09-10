import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';

class Product {
  final int? sold;

  final List<String>? images;

  final List<CatogeryBrand>? subcategory;

  final int? ratingsQuantity;

  final String? title;

  final String? description;

  final int? quantity;

  final int? price;

  final String? imageCover;

  final CatogeryBrand? category;

  final CatogeryBrand? brand;

  final int? ratingsAverage;

  final String? id;

  final int? priceAfterDiscount;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.priceAfterDiscount,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,

    this.id,
  });
}
