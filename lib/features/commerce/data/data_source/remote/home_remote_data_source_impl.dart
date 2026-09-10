import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/features/commerce/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/network/api/api_client.dart';
import 'package:ecommerce/features/network/api/api_result.dart';
import 'package:ecommerce/features/network/models/response/catogery/catogery_brand_responce_dto.dart';
import 'package:ecommerce/features/network/models/response/product/product_responce_dto.dart';
import 'package:ecommerce/features/network/utils/handle_dio_exception.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiClient _apiClient;

  HomeRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<ApiResult<CatogeryBrandResponceDto>> getBrands() async {
    try {
      var responce = await _apiClient.getBrands();
      return SuccessApiResult(data: responce);
    } on DioException catch (e) {
      return handleDioException(e);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<ApiResult<CatogeryBrandResponceDto>> getCategories() async {
    try {
      var responce = await _apiClient.getCatogeries();
      return SuccessApiResult(data: responce);
    } on DioException catch (e) {
      return handleDioException(e);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<ApiResult<ProductResponceDto>> getProducts() async {
    try {
      var responce = await _apiClient.getProducts();
      return SuccessApiResult(data: responce);
    } on DioException catch (e) {
      return handleDioException(e);
    } catch (e) {
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }
}
