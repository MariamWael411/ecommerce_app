import 'package:ecommerce/core/utils/resource.dart';

class RegisterStates {
  late Resource<void> registerState;

  RegisterStates({required this.registerState});

  RegisterStates.initial() {
    registerState = Resource.initial();
  }
}
