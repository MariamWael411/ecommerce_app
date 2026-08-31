import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widget/custom_auth_widget.dart';
import '../../widget/custom_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.037),
          child: Column(
            spacing: height * 0.01,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.routeLogo),
              SizedBox(height: height * 0.02),

              CustomAuthWidget(
                text: AppStrings.fullName,
                hintText: AppStrings.fullNameHintText,
              ),
              SizedBox(height: height * 0.01),
              CustomAuthWidget(
                text: AppStrings.mobileNum,
                hintText: AppStrings.mobileNumHintText,
              ),
              SizedBox(height: height * 0.01),
              CustomAuthWidget(
                text: AppStrings.email,
                hintText: AppStrings.emailHintText,
              ),
              SizedBox(height: height * 0.01),
              CustomAuthWidget(
                text: AppStrings.password,
                hintText: AppStrings.passwordHintText,
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.blackAlphaColor,
                  size: 30,
                ),
              ),
              SizedBox(height: height * 0.03),
              CustomElevatedButton(
                child: Text(AppStrings.signUp, style: AppStyles.sem20Blue),
                onTap: () {},
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
