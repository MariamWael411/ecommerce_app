import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:ecommerce/features/common/utils/resource.dart';

class ProductStates {
  Resource<List<Product>> apiProduct = Resource.initial();

  ProductStates({required this.apiProduct});

  ProductStates.initial() {
    apiProduct = Resource.initial();
  }
}
