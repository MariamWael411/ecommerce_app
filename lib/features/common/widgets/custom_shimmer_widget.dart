import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_config.dart';

class CustomShimmerWidget extends StatelessWidget {
  CustomShimmerWidget({super.key, this.axis, this.child, this.aspectRatio});

  Axis? axis;
  Widget? child;
  double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: Duration(milliseconds: 300),
      child: SizedBox(
        height: height * 0.3,
        child: GridView.builder(
          scrollDirection: axis ?? Axis.horizontal,
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: width * 0.04,
            childAspectRatio: aspectRatio ?? 16 / 10,
          ),
          itemBuilder: (context, index) {
            return child ?? Image.asset(AppAssets.circlerImage);
          },
        ),
      ),
    );
  }
}
