import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_config.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_text_form_feild.dart';

class CustomAuthWidget extends StatelessWidget {
  String text;
  String hintText;
  Widget? suffixIcon;

  CustomAuthWidget({super.key,required this.text,required this.hintText,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    return Column(
      spacing:height*0.02 ,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text,style: AppStyles.med18White,),
        CustomTextFormFeild(hintText: hintText,suffixIcon: suffixIcon,),
      ],
    );
  }
}
