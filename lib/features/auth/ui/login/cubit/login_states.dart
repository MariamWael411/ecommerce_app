import 'package:ecommerce/features/common/utils/resource.dart';

class LoginStates {
  late Resource<void> loginState;

  LoginStates({required this.loginState});

  LoginStates.initial() {
    loginState = Resource.initial();
  }
}
