import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/common/row_color.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_config.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Container(
      height: height * 0.145,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeColor, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: width * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: width * 0.25,
              height: double.infinity,

              imageUrl:
                  "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=800&q=80",
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: AppColors.blueColor),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Nike Air Jordon', style: AppStyles.med18DarkBlue),
                  SizedBox(width: width * 0.14),
                  IconButton(
                    style: IconButton.styleFrom(
                      hoverColor: AppColors.hoverColor,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    icon: Image.asset(AppAssets.favorite),
                  ),
                ],
              ),
              RowColor(),
              Row(
                spacing: width * 0.017,
                children: [
                  Text('EGP 1,200', style: AppStyles.med18DarkBlue),
                  Text('EGP 1,500', style: AppStyles.reg11Discount),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.014,
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text('Add to Card', style: AppStyles.med14White),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ],
      ),
    );
  }
}
