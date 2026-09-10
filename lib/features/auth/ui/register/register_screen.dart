import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/features/auth/ui/register/cubit/register_cubit.dart';
import 'package:ecommerce/features/auth/ui/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/utils_dialog.dart';
import '../../../../core/utils/validation.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/custom_auth_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passwordController = TextEditingController(
      text: 'QWrdswe12@#1');
  TextEditingController rePasswordController = TextEditingController(
      text: "QWrdswe12@#1");
  TextEditingController emailController = TextEditingController(
      text: 'mariam@gmail.com');
  TextEditingController nameController = TextEditingController(text: 'mariam');
  TextEditingController phoneController = TextEditingController(
      text: '01023456789');
  bool obsurePassword = true;
  bool obsureRePassword = true;

  final _formKry = GlobalKey<FormState>();
  RegisterCubit cubit = getIt();

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.037),
          child: Form(
            key: _formKry,
            child: SingleChildScrollView(
              child: Column(
                spacing: height * 0.01,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.05),
                  Image.asset(AppAssets.routeLogo),
                  SizedBox(height: height * 0.02),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAuthWidget(
                          controller: nameController,
                          onValidator: (text) {
                            return Validation.validateFullName(text);
                          },
                          text: AppStrings.fullName,
                          hintText: AppStrings.fullNameHintText,
                        ),
                        SizedBox(height: height * 0.01),
                        CustomAuthWidget(
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                          onValidator: (text) {
                            return Validation.validateMobileNum(text);
                          },
                          text: AppStrings.mobileNum,
                          hintText: AppStrings.mobileNumHintText,
                        ),
                        SizedBox(height: height * 0.01),
                        CustomAuthWidget(
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          onValidator: (text) {
                            return Validation.validateEmail(text);
                          },
                          text: AppStrings.email,
                          hintText: AppStrings.emailHintText,
                        ),
                        SizedBox(height: height * 0.01),
                        CustomAuthWidget(
                          obscure: obsurePassword,
                          controller: passwordController,
                          onValidator: (text) {
                            return Validation.validatePassword(text);
                          },
                          text: AppStrings.password,
                          hintText: AppStrings.passwordHintText,
                          suffixIcon: IconButton(
                            onPressed: () {
                              obsurePassword = !obsurePassword;
                              setState(() {});
                            },
                            icon: Icon(
                              (obsurePassword)
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.blackAlphaColor,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomAuthWidget(
                          obscure: obsureRePassword,
                          controller: rePasswordController,
                          onValidator: (text) {
                            return Validation.rePasswordValidator(
                              text,
                              passwordController,
                            );
                          },
                          text: 'RePassword',
                          hintText: 'enter confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              obsureRePassword = !obsureRePassword;
                              setState(() {});
                            },
                            icon: Icon(
                              (obsureRePassword)
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.blackAlphaColor,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),

                  BlocListener<RegisterCubit, RegisterStates>(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state.registerState.isLoading) {
                        UtilsDialog.showLoading(
                          context: context,
                          content: 'loading...',
                        );
                      } else if (state.registerState.isSuccess) {
                        UtilsDialog.hideDialog(context: context);
                        UtilsDialog.showMessage(
                          context: context,
                          content: 'Register Successfully',
                          title: 'success',
                          posAction: 'ok',
                          posActions: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.homeScreen,
                            );
                          },
                        );
                      } else if (state.registerState.isError) {
                        UtilsDialog.hideDialog(context: context);
                        UtilsDialog.showMessage(
                          context: context,
                          content: state.registerState.errorMessage ?? 'error',
                          title: 'Error',
                          posAction: 'ok',
                            posActions: () {
                              print('register Screen ${state.registerState
                                  .errorMessage }');
                            }
                        );
                      }
                    },
                    child: CustomElevatedButton(
                      child: Text(
                        AppStrings.signUp,
                        style: AppStyles.sem20Blue,
                      ),
                      onTap: () {
                        //todo:register
                        if (_formKry.currentState?.validate() == true) {
                          cubit.register(
                            email: emailController.text,
                            password: passwordController.text,
                            repassword: rePasswordController.text,
                            phone: phoneController.text,
                            name: nameController.text,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppStyles.med18White,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginScreen);
                        },
                        child: Text('Login', style: AppStyles.med18White),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
