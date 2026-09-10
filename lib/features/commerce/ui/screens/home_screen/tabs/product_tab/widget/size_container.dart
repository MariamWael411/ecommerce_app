import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_config.dart';

class SizeContainer extends StatelessWidget {
  SizeContainer({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onClick,
  });

  String size;
  bool isSelected;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueColor : null,
          borderRadius: isSelected ? BorderRadius.circular(50) : null,
        ),
        child: Center(
          child: Text(
            size,
            style: isSelected ? AppStyles.reg14White : AppStyles.reg14DarkBlue,
          ),
        ),
      ),
    );
  }
}
