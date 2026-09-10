import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';
import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:ecommerce/features/network/api/api_result.dart';

abstract class HomeRepository {
  Future<ApiResult<List<CatogeryBrand>>> getCategories();

  Future<ApiResult<List<CatogeryBrand>>> getBrands();

  Future<ApiResult<List<Product>>> getProducts();
}
