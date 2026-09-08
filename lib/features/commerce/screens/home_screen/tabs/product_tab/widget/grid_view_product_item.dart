import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_config.dart';

class GridViewProductItem extends StatelessWidget {
  const GridViewProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Container(
      width: width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.strokeColor, width: 2),
      ),
      child: Column(
        spacing: height * 0.01,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  topLeft: Radius.circular(13),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: width * 0.5,
                  height: height * 0.16,

                  imageUrl:
                      "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=800&q=80",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(
                          color: AppColors.blueColor)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(AppAssets.favoriteSelectedIcon),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              spacing: height * 0.01,
              children: [
                Text(
                  'Nike Air Jordon \nNike shoes flexible for wo..',
                  style: AppStyles.reg14DarkBlue,
                ),
                Row(
                  spacing: width * 0.02,
                  children: [
                    Text('EGP 1,000', style: AppStyles.reg14DarkBlue),
                    Text('1,300 EGP', style: AppStyles.reg11Discount),
                  ],
                ),
                Row(
                  children: [
                    Text('Review (4.8) ', style: AppStyles.reg14DarkBlue),
                    Image.asset(AppAssets.star),
                    Spacer(),
                    InkWell(onTap: () {}, child: Image.asset(AppAssets.plus)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
