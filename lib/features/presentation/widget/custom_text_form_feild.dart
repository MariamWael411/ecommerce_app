import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onValidator,
    this.obscure = false,
    this.textInputType,
  });

  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator? onValidator;
  TextEditingController? controller;
  bool obscure;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      cursorColor: AppColors.blackAlphaColor,
      style: AppStyles.light18BlackAlpha,
      controller: controller,
      validator: onValidator,
      obscureText: obscure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:AppStyles.light18BlackAlpha,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.whiteColor,
        filled: true,
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        errorBorder: _outlineInputBorder(borderSideColor: AppColors.redColor),
        focusedErrorBorder: _outlineInputBorder(
          borderSideColor: AppColors.redColor,
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder({Color? borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderSideColor ?? AppColors.whiteColor),
    );
  }
}