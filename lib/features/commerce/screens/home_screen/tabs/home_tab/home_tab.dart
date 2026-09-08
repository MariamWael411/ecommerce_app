import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/home_tab/widget/gride_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../../../core/utils/app_config.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<String> imageSlider = [
    AppAssets.slide1,
    AppAssets.slide2,
    AppAssets.slide3,
  ];

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return SingleChildScrollView(
      child: Column(
        spacing: height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageSlideshow(
            indicatorRadius: 4,
            indicatorBottomPadding: width * 0.02,
            indicatorPadding: width * 0.02,
            indicatorColor: AppColors.blueColor,
            initialPage: 0,
            height: height * 0.2,
            disableUserScrolling: true,
            autoPlayInterval: 1000,
            isLoop: true,

            children: [
              image(imageSlider[0]),
              image(imageSlider[1]),
              image(imageSlider[2]),
            ],
          ),
          row('Categories'),
          gridView(height: height, width: width),
          row('Brands'),
          gridView(height: height, width: width),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Image image(String image) {
    return Image.asset(image, height: double.infinity, fit: BoxFit.fill);
  }

  SizedBox gridView({required double height, required double width}) {
    return SizedBox(
      height: height * 0.3,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: width * 0.04,
          childAspectRatio: 16 / 10,
        ),
        itemBuilder: (context, index) {
          return GrideViewItem();
        },
      ),
    );
  }

  Row row(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.med18DarkBlue),
        Text('view all', style: AppStyles.reg12DarkBlue),
      ],
    );
  }
}
