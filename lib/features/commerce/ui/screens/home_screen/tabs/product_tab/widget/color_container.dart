import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_config.dart';

class ColorContainer extends StatelessWidget {
  ColorContainer({
    super.key,
    required this.color,
    required this.onClick,
    required this.isSelected,
  });

  Color color;
  VoidCallback onClick;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width * 0.08,
        height: height * 0.03,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Visibility(
          visible: isSelected,
          child: Icon(Icons.check, color: AppColors.whiteColor, size: 25),
        ),
      ),
    );
  }
}
