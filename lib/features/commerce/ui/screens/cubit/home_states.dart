import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';
import 'package:ecommerce/features/common/utils/resource.dart';

class HomeStates {
  Resource<List<CatogeryBrand>> apiCategories = Resource.initial();
  Resource<List<CatogeryBrand>> apiBrands = Resource.initial();

  HomeStates({required this.apiBrands, required this.apiCategories});

  HomeStates.initial() {
    apiCategories = Resource.initial();
    apiBrands = Resource.initial();
  }
}
