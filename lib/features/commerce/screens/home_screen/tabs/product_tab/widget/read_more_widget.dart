import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_styles.dart';

class ReadMoreWidget extends StatelessWidget {
  ReadMoreWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Line,
      trimLines: 2,
      colorClickableText: AppColors.blueColor,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: AppStyles.reg14LightBlue,
      lessStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.blueColor,
      ),
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.blueColor,
      ),
    );
  }
}
