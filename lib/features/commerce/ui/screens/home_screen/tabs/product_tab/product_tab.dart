import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/product_tab/cubit/product_cubit.dart';
import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/product_tab/cubit/product_states.dart';
import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/product_tab/widget/grid_view_product_item.dart';
import 'package:ecommerce/features/common/widgets/custom_shimmer_widget.dart';
import 'package:ecommerce/features/common/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/utils/app_config.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  var cubit = getIt<ProductCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.loadProduct();
  }
  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return BlocBuilder<ProductCubit, ProductStates>(
      bloc: cubit,
      builder: (context, state) {
        if (state.apiProduct.isSuccess) {
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
                              AppRoutes.productDetailsScreen, arguments: state
                              .apiProduct.data![index]);
                        },
                        child: GridViewProductItem(
                          product: state.apiProduct.data![index],));
                  },
                ),
              ),
              SizedBox(height: height * 0.02,)
            ],
          );
        } else if (state.apiProduct.isError) {
          return MainErrorWidget(errorMessage: state.apiProduct.errorMessage!);
        } else {
          return CustomShimmerWidget(
            axis: Axis.vertical,
            aspectRatio: 16 / 24,
            child: Container(
              height: height * 0.2,
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.02
              ),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        }
      },

    );
  }
}
