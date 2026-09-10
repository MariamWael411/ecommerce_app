import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/commerce/domain/entities/product/product.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_config.dart';

class GridViewProductItem extends StatefulWidget {
  GridViewProductItem({super.key, required this.product});

  Product product;

  @override
  State<GridViewProductItem> createState() => _GridViewProductItemState();
}

class _GridViewProductItemState extends State<GridViewProductItem> {
  bool isFavorite = false;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  height: height * 0.12,

                  imageUrl: widget.product.imageCover ?? '',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(
                          color: AppColors.blueColor)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              IconButton(
                onPressed: () {
                  isFavorite = !isFavorite;
                  setState(() {

                  });
                },
                style: IconButton.styleFrom(
                    hoverColor: AppColors.hoverColor
                ),
                icon: Image.asset(isFavorite ? AppAssets.favorite : AppAssets
                    .favoriteSelectedIcon),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: height * 0.01,
              children: [
                Text(widget.product.title ?? '',
                  style: AppStyles.reg14DarkBlue,
                ),
                Row(
                  spacing: width * 0.02,
                  children: [
                    Text('EGP ${widget.product.price}',
                        style: AppStyles.reg14DarkBlue),
                    Text('${widget.product.priceAfterDiscount ?? 0} EGP',
                        style: AppStyles.reg11Discount),
                  ],
                ),
                Row(
                  children: [
                    Text('Review (${widget.product.ratingsQuantity}) ',
                        style: AppStyles.reg14DarkBlue),
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
