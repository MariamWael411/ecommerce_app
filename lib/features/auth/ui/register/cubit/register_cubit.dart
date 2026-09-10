import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domain/entities/request/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register_use_case.dart';
import 'package:ecommerce/features/auth/ui/register/cubit/register_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/resource.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterUseCase _registerUseCase;

  RegisterCubit({required this._registerUseCase})
    : super(RegisterStates.initial());

  Future<void> register({
    required String email,
    required String password,
    required String repassword,
    required String phone,
    required String name,
  }) async {
    emit(RegisterStates(registerState: Resource.loading()));
    RegisterRequest registerRequest = RegisterRequest(
      password: password,
      email: email,
      rePassword: repassword,
      phone: phone,
      name: name,
    );
    var result = await _registerUseCase(registerRequest);
    if (result.isSuccess) {
      emit(RegisterStates(registerState: Resource.success(data: null)));
    } else {
      emit(
        RegisterStates(
          registerState: Resource.error(errorMessage: result.getError.error),
        ),
      );
    }
  }
}
