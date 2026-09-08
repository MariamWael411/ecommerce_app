import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_config.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../common/custom_text_form_feild.dart';

typedef OnValidator = String? Function(String?)?;

class CustomAuthWidget extends StatelessWidget {
  String text;
  String hintText;
  Widget? suffixIcon;
  OnValidator? onValidator;
  TextEditingController? controller;
  TextInputType? textInputType;
  bool obscure;

  CustomAuthWidget({
    super.key,
    required this.text,
    required this.hintText,
    this.suffixIcon,
    this.onValidator,
    this.controller,
    this.textInputType,
    this.obscure = false,
  });
  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    return Column(
      spacing:height*0.02 ,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text,style: AppStyles.med18White,),
        CustomTextFormFeild(
          textInputType: textInputType,
          obscure: obscure,
          hintText: hintText,
          suffixIcon: suffixIcon,
          onValidator: onValidator,
          controller: controller,
        ),
      ],
    );
  }
}
