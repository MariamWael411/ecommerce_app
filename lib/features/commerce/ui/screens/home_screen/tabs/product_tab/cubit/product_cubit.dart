import 'package:ecommerce/features/commerce/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/product_tab/cubit/product_states.dart';
import 'package:ecommerce/features/common/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductStates> {
  GetProductsUseCase _productsUseCase;

  ProductCubit({required this._productsUseCase})
    : super(ProductStates.initial());

  loadProduct() async {
    emit(ProductStates(apiProduct: Resource.loading()));
    var responce = await _productsUseCase();
    if (responce.isSuccess) {
      emit(ProductStates(apiProduct: Resource.success(data: responce.getData)));
    } else {
      emit(
        ProductStates(
          apiProduct: Resource.error(errorMessage: responce.getError.error),
        ),
      );
    }
  }
}
