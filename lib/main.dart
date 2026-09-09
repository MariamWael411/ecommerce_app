import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/cache/shared_prefernces/shared_preferences_utils.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_theme.dart';
import 'package:ecommerce/features/cart/cart_screen.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/utils/observer.dart';
import 'features/auth/ui/login/login_screen.dart';
import 'features/auth/ui/register/register_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferencesUtils.init();
  SharedPreferencesUtils preferencesUtils = getIt();
  String? token = preferencesUtils.getData(key: 'token') as String?;
  runApp(MyApp(isLogged: token != null));
}

}
class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp({super.key, this.isLogged = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: isLogged ? AppRoutes.homeScreen : AppRoutes.loginScreen,
      routes: {AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.productDetailsScreen: (context) => ProductDetailsScreen(),
        AppRoutes.cartScreen: (context) => CartScreen()
      },
    );
  }
}
