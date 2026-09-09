import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/widget/color_container.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/widget/image_slider.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/widget/read_more_widget.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/widget/size_container.dart';
import 'package:ecommerce/features/common/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_config.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> images = [
    "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=800&q=80",
    'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=800&q=80',
    'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&q=80',
  ];

  List<Color> colorsList = [
    AppColors.brownColor,
    AppColors.darkOrangeColor,
    AppColors.skyColor,
    AppColors.greenColor,
    AppColors.lightRedColor,
  ];
  List<String> sizeList = ['38', '39', '40', '41', '42'];
  int sizeIndex = 0;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: AppColors.blueColor,
            size: 28,
          ),
        ),
        title: Text('Product Details', style: AppStyles.med20DarkBlue),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.searchIcon)),
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppAssets.shoppingCartIcon),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: height * 0.02,
            children: [
              SizedBox(height: height * 0.01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.strokeColor, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ImageSlider(images: images),
                      IconButton(
                        style: IconButton.styleFrom(
                          hoverColor: AppColors.hoverColor,
                        ),
                        onPressed: () {},
                        icon: Image.asset(AppAssets.favoriteSelectedIcon),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [text('Nike Air Jordon'), text('EGP 3,500')],
              ),
              Row(
                spacing: width * 0.02,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.01,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.strokeColor,
                        width: 1,
                      ),
                    ),
                    child: Text('3,230 Sold', style: AppStyles.med14DarkBlue),
                  ),
                  SizedBox(width: width * 0.03),
                  Image.asset(AppAssets.star),
                  Text('4.8 (7,500)', style: AppStyles.reg14DarkBlue),
                  Spacer(),
                  Container(
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
                          icon: Image.asset(AppAssets.minusIcon),
                        ),
                        Text('1', style: AppStyles.med18White),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppAssets.plusIcon),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              text('Description'),
              ReadMoreWidget(
                text:
                    "'Flutter is Google’s mobile UI open source framework "
                    "to build high-quality native "
                    "(super fast) interfaces for "
                    "iOS and Android apps with the unified codebase.'",
              ),
              text('Size'),
              SizedBox(
                height: height * 0.037,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizeContainer(
                      size: sizeList[index],
                      isSelected: sizeIndex == index,
                      onClick: () {
                        sizeIndex = index;
                        setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: width * 0.03),
                  itemCount: sizeList.length,
                ),
              ),
              text('Color'),
              SizedBox(
                height: height * 0.037,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ColorContainer(
                      color: colorsList[index],
                      onClick: () {
                        currentIndex = index;
                        setState(() {});
                      },
                      isSelected: currentIndex == index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.01);
                  },
                  itemCount: colorsList.length,
                ),
              ),

              SizedBox(height: height * 0.01),

              Row(
                spacing: width * 0.06,
                children: [
                  Column(
                    spacing: height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total price', style: AppStyles.med18StrokeBlue),
                      text('EGP 3,500'),
                    ],
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      radius: 30,
                      backgroundColor: AppColors.blueColor,
                      child: Row(
                        spacing: width * 0.02,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.cart),
                          Text('Add to cart', style: AppStyles.med20White),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Text text(String text) {
    return Text(text, style: AppStyles.med18DarkBlue);
  }
}
