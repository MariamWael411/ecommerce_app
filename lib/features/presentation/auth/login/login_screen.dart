import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/presentation/widget/custom_auth_widget.dart';
import 'package:ecommerce/features/presentation/widget/custom_elevated_button.dart';
import 'package:ecommerce/features/presentation/widget/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: width*0.037
          ),
          child: Column(
            spacing: height*0.01,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.routeLogo),
              SizedBox(height: height*0.02,),
              Text('Welcome Back To Route',style: AppStyles.sem24White,),
              Text('Please sign in with your mail',style: AppStyles.light16White,),
              SizedBox(height: height*0.032,),
             CustomAuthWidget(text:'User Name' , hintText: 'enter your name'),
              SizedBox(height: height*0.01,),
              CustomAuthWidget(text:'Password' , hintText: 'enter your password',suffixIcon: Icon(Icons.visibility_off_outlined,color: AppColors.blackAlphaColor,size: 30,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text('Forgot password',style: AppStyles.reg18White,)),
                ],
              ),
              SizedBox(height: height*0.03,),
              CustomElevatedButton(child: Text('Login',style: AppStyles.sem20Blue,), onTap: (){}),
             SizedBox(height: height*0.01,),
             Row(
               children: [
                 Text('Don’t have an account? ',style: AppStyles.med18White,),
                 GestureDetector(
                   onTap: (){},
                     child: Text('Create Account ',style: AppStyles.med18White,)),

               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
