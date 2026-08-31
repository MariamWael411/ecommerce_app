import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/features/presentation/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.loginScreen ,
      routes: {AppRoutes.loginScreen:(context) => LoginScreen()},
    );
  }
}
