import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/widget/grid_view_product_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_config.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16 / 24,
                mainAxisSpacing: height * 0.02,
                crossAxisSpacing: width * 0.02
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        AppRoutes.productDetailsScreen);
                  },
                  child: GridViewProductItem());
            },
          ),
        ),
        SizedBox(height: height * 0.02,)
      ],
    );
  }
}
