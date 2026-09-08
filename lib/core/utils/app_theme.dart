import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
    scaffoldBackgroundColor: AppColors.whiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blueColor,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
