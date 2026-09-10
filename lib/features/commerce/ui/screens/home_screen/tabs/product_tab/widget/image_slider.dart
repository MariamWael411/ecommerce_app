import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_config.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({super.key, required this.images});

  List<String> images;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return ImageSlideshow(
      indicatorRadius: 4,

      indicatorBottomPadding: width * 0.02,
      indicatorPadding: width * 0.02,
      indicatorColor: AppColors.blueColor,
      initialPage: 0,
      height: height * 0.27,
      disableUserScrolling: true,
      autoPlayInterval: 1000,
      isLoop: true,
      children: images.map((e) {
        return CachedNetworkImage(
          fit: BoxFit.fill,
          width: width * 0.5,
          height: height * 0.2,
          imageUrl: e,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(color: AppColors.blueColor),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }).toList(),
    );
  }
}
