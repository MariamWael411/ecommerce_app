import 'package:ecommerce/core/utils/app_config.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/common/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  String errorMessage;
  VoidCallback? onPressed;
  bool isButton;

  MainErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: height * 0.02,
      children: [
        Text(errorMessage, style: AppStyles.bold20Blue),
        isButton
            ? CustomElevatedButton(
                onTap: onPressed ?? () {},
                child: Text('Try Again'),
              )
            : Container(),
      ],
    );
  }
}
