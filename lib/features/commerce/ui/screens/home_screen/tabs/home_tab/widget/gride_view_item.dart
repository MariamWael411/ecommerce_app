import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_config.dart';



class GrideViewItem extends StatelessWidget {
  GrideViewItem({super.key, required this.title, required this.image});

  String title;
  String image;

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

            imageUrl: image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(
                    color: AppColors.blueColor)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(
          title,
          style: AppStyles.reg14DarkBlue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
