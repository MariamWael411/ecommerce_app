import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/commerce/domain/entities/category/catogrey_brand.dart';
import 'package:ecommerce/features/commerce/ui/screens/cubit/home_cubit.dart';
import 'package:ecommerce/features/commerce/ui/screens/cubit/home_states.dart';
import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/home_tab/widget/gride_view_item.dart';
import 'package:ecommerce/features/common/widgets/custom_shimmer_widget.dart';
import 'package:ecommerce/features/common/widgets/main_error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../../../../core/utils/app_config.dart';


class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> imageSlider = [
    AppAssets.slide1,
    AppAssets.slide2,
    AppAssets.slide3,
  ];
  var cubit = getIt<HomeCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.loadBrands();
    cubit.loadCategories();
  }
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
          BlocBuilder<HomeCubit, HomeStates>(
            buildWhen: (previous, current) {
              return previous.apiCategories != current.apiCategories;
            },
            bloc: cubit,

            builder: (context, state) {
              if (state.apiCategories.isSuccess) {
                return gridView(height: height,
                    width: width,
                    categoryBrand: state.apiCategories.data ?? []);
              } else if (state.apiCategories.isError) {
                return MainErrorWidget(
                    errorMessage: state.apiCategories.errorMessage!);
              } else {
                return CustomShimmerWidget();
              }
            },
          ),
          row('Brands'),
          BlocBuilder<HomeCubit, HomeStates>(
            buildWhen: (previous, current) {
              return previous.apiBrands != current.apiBrands;
            },
            bloc: cubit,
            builder: (context, state) {
              if (state.apiBrands.isSuccess) {
                return gridView(height: height,
                    width: width,
                    categoryBrand: state.apiBrands.data ?? []);
              } else if (state.apiBrands.isError) {
                return MainErrorWidget(
                    errorMessage: state.apiBrands.errorMessage!);
              } else {
                return CustomShimmerWidget();
              }
            },
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Image image(String image) {
    return Image.asset(image, height: double.infinity, fit: BoxFit.fill);
  }

  SizedBox gridView(
      {required double height, required double width, required List<
          CatogeryBrand> categoryBrand}) {
    return SizedBox(
      height: height * 0.3,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryBrand.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: width * 0.04,
          childAspectRatio: 16 / 10,
        ),
        itemBuilder: (context, index) {
          return GrideViewItem(title: categoryBrand[index].name ?? "",
              image: categoryBrand[index].image ?? "");
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
