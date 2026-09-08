import 'package:ecommerce/core/utils/resource.dart';
import 'package:ecommerce/features/auth/domain/entities/request/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce/features/auth/ui/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginUseCase _loginUseCase;

  LoginCubit({required this._loginUseCase}) : super(LoginStates.initial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginStates(loginState: Resource.loading()));
    LoginRequest loginRequest = LoginRequest(password: password, email: email);
    var result = await _loginUseCase(loginRequest);
    if (result.isSuccess) {
      emit(LoginStates(loginState: Resource.success()));
    } else {
      emit(
        LoginStates(
          loginState: Resource.error(errorMessage: result.getError.error),
        ),
      );
    }
  }
}
