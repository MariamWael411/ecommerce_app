import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_config.dart';


class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key, required this.child, required this.onTap, this.backgroundColor, this.sideColor});

  Color? backgroundColor;
  Widget child;
  VoidCallback onTap;
  Color? sideColor;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.017,
            horizontal: width * 0.02
        ),
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        side: BorderSide(
            color: sideColor ?? AppColors.whiteColor
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}