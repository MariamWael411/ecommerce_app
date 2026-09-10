import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/commerce/domain/use_cases/get_brands_use_case.dart';
import 'package:ecommerce/features/commerce/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/commerce/ui/screens/cubit/home_states.dart';
import 'package:ecommerce/features/common/utils/resource.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  GetCategoriesUseCase _categoriesUseCase;
  GetBrandsUseCase _brandsUseCase;

  HomeCubit({required this._brandsUseCase, required this._categoriesUseCase})
    : super(HomeStates.initial());

  Future<void> loadBrands() async {
    emit(
      HomeStates(
        apiBrands: Resource.loading(),
        apiCategories: state.apiCategories,
      ),
    );
    var responce = await _brandsUseCase();
    if (responce.isSuccess) {
      emit(
        HomeStates(
          apiBrands: Resource.success(data: responce.getData),
          apiCategories: state.apiCategories,
        ),
      );
    } else {
      emit(
        HomeStates(
          apiBrands: Resource.error(errorMessage: responce.getError.error),
          apiCategories: state.apiCategories,
        ),
      );
    }
  }

  Future<void> loadCategories() async {
    emit(
      HomeStates(apiCategories: Resource.loading(), apiBrands: state.apiBrands),
    );
    var responce = await _categoriesUseCase();
    if (responce.isSuccess) {
      emit(
        HomeStates(
          apiCategories: Resource.success(data: responce.getData),
          apiBrands: state.apiBrands,
        ),
      );
    } else {
      emit(
        HomeStates(
          apiCategories: Resource.error(errorMessage: responce.getError.error),
          apiBrands: state.apiBrands,
        ),
      );
    }
  }
}
