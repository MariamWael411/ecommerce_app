import 'package:ecommerce/features/cart/widget/cart_item_widget.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_config.dart';
import '../../core/utils/app_styles.dart';
import '../common/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        title: Text('Cart', style: AppStyles.med20DarkBlue),
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
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CartItemWidget();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.02);
                },
                itemCount: 3,
              ),
            ),

            Row(
              spacing: width * 0.06,
              children: [
                Column(
                  spacing: height * 0.01,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total price', style: AppStyles.med18StrokeBlue),
                    Text('EGP 3,500', style: AppStyles.med18DarkBlue),
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
                        Text('Check Out', style: AppStyles.med20White),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColors.whiteColor,
                          size: 26,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.07),
          ],
        ),
      ),
    );
  }
}
