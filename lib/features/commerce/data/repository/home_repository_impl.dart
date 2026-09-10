import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/core/errors/app_error.dart';
import 'package:ecommerce/core/utils/connectivity_extention.dart';
import 'package:ecommerce/features/commerce/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/commerce/data/mappers/to_category_brand.dart';
import 'package:ecommerce/features/commerce/data/mappers/to_product.dart';
import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';
import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:ecommerce/features/commerce/domain/repository/home_repository.dart';
import 'package:ecommerce/features/network/api/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource _homeRemoteDataSource;
  Connectivity _connectivity;

  HomeRepositoryImpl({
    required this._connectivity,
    required this._homeRemoteDataSource,
  });

  @override
  Future<ApiResult<List<CatogeryBrand>>> getBrands() async {
    if (await _connectivity.isConnected()) {
      //todo: remote ds
      //todo: ApiResult<CatogeryBrandResponceDto>
      var apiResult = await _homeRemoteDataSource.getBrands();
      if (apiResult.isSuccess && apiResult.getData.data != null) {
        return SuccessApiResult(
          data: apiResult.getData.data!.toCategoryBrandList(),
        );
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<ApiResult<List<CatogeryBrand>>> getCategories() async {
    if (await _connectivity.isConnected()) {
      //todo: remote ds
      //todo: ApiResult<CatogeryBrandResponceDto>
      var apiResult = await _homeRemoteDataSource.getCategories();
      if (apiResult.isSuccess && apiResult.getData.data != null) {
        return SuccessApiResult(
          data: apiResult.getData.data!.toCategoryBrandList(),
        );
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<ApiResult<List<Product>>> getProducts() async {
    if (await _connectivity.isConnected()) {
      //todo: remote ds
      //todo: ApiResult<ProductResponceDto>
      var apiResult = await _homeRemoteDataSource.getProducts();
      if (apiResult.isSuccess && apiResult.getData.data != null) {
        return SuccessApiResult(data: apiResult.getData.data!.toProductList());
      } else {
        return ErrorApiResult(
          errorMessage: ServerError(error: apiResult.getError.error),
        );
      }
    } else {
      return ErrorApiResult(errorMessage: NetworkError());
    }
  }
}
