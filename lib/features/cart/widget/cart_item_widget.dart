import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_config.dart';
import '../../../core/utils/app_styles.dart';
import '../../common/row_color.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Container(
      height: height * 0.15,
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
                  SizedBox(width: width * 0.16),
                  IconButton(
                    style: IconButton.styleFrom(
                      hoverColor: AppColors.hoverColor,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    icon: Icon(Bootstrap.trash, color: AppColors.blueColor),
                  ),
                ],
              ),
              Row(
                spacing: width * 0.01,
                children: [
                  RowColor(textStyle: AppStyles.reg14Purple),
                  Container(
                    height: height * 0.016,
                    width: width * 0.004,
                    color: AppColors.purpleColor,
                  ),
                  Text('Size: 40', style: AppStyles.reg14Purple),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                spacing: width * 0.1,
                children: [
                  Text('EGP 1,200', style: AppStyles.med18DarkBlue),
                  Container(
                    height: height * 0.046,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(padding: EdgeInsets.zero),
                          icon: Image.asset(AppAssets.minusIcon),
                        ),
                        Text('1', style: AppStyles.med18White),
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(padding: EdgeInsets.zero),
                          icon: Image.asset(AppAssets.plusIcon),
                        ),
                      ],
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
