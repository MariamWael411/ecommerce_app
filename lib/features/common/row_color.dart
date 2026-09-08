import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_config.dart';

class RowColor extends StatelessWidget {
  RowColor({super.key, this.textStyle});

  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Row(
      spacing: width * 0.01,
      children: [
        Container(
          width: width * 0.033,
          height: height * 0.016,
          decoration: BoxDecoration(
            color: AppColors.darkOrangeColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text('Orange color', style: textStyle ?? AppStyles.reg14DarkBlue),
      ],
    );
  }
}
