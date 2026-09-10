import 'package:ecommerce/features/network/api/api_result.dart';
import 'package:ecommerce/features/network/models/response/catogery/catogery_brand_responce_dto.dart';
import 'package:ecommerce/features/network/models/response/product/product_responce_dto.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<CatogeryBrandResponceDto>> getCategories();

  Future<ApiResult<CatogeryBrandResponceDto>> getBrands();

  Future<ApiResult<ProductResponceDto>> getProducts();
}
