import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:ecommerce/features/commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api/api_result.dart';

@lazySingleton
class GetProductsUseCase {
  final HomeRepository _homeRepository;

  GetProductsUseCase({required this._homeRepository});

  Future<ApiResult<List<Product>>> call() {
    return _homeRepository.getProducts();
  }
}
