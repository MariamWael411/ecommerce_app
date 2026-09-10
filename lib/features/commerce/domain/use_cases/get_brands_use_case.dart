import 'package:ecommerce/features/commerce/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api/api_result.dart';
import '../entities/category/catogrey_brand.dart';

@lazySingleton
class GetBrandsUseCase {
  final HomeRepository _homeRepository;

  GetBrandsUseCase({required this._homeRepository});

  Future<ApiResult<List<CatogeryBrand>>> call() {
    return _homeRepository.getBrands();
  }
}
