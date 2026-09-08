import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_config.dart';

class GrideViewItem extends StatelessWidget {
  const GrideViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Column(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            width: width * 0.23,
            height: height * 0.1,

            imageUrl:
                "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=800&q=80",
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(
                    color: AppColors.blueColor)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(
          'Women’s fashion',
          style: AppStyles.reg14DarkBlue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
