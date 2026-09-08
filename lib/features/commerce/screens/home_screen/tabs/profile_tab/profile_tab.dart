import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/common/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_config.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  var nameController = TextEditingController(text: 'Mohamed Mohamed Nabil');
  var emailController = TextEditingController(text: 'mohamed.N@gmail.com');
  var mobileController = TextEditingController(text: '01122118855');
  var addressController = TextEditingController(
      text: '6th October, street 11.....');

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return SingleChildScrollView(
      child: Column(
        spacing: height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome, Mohamed', style: AppStyles.med18DarkBlue,),
                    Text(
                      'mohamed.N@gmail.com', style: AppStyles.med14LightBlue,)
                  ]),
              IconButton(onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginScreen, (route) => false,);
              }, icon: Icon(Icons.logout, color: AppColors.darkBlueColor,)),
            ],
          ),
          SizedBox(height: height * 0.03,),
          profileEdit('Your full name', nameController, height),
          profileEdit('Your E-mail', emailController, height),
          profileEdit('Your mobile number', mobileController, height),
          profileEdit('Your Address', addressController, height),
        ],
      ),
    );
  }

  Column profileEdit(String text, var controller, var height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.01,
      children: [
        Text(text, style: AppStyles.med18DarkBlue,),
        CustomTextFormFeild(hintText: '',
            controller: controller,
            textStyle: AppStyles.med14DarkBlue,
            borderSideColor: AppColors.strokeColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_outlined, color: AppColors.darkBlueColor,),)),
        SizedBox(height: height * 0.02,)
      ],
    );
  }
}
