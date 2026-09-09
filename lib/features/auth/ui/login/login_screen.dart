import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_strings.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/utils_dialog.dart';
import 'package:ecommerce/features/auth/ui/login/cubit/login_cubit.dart';
import 'package:ecommerce/features/auth/ui/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_config.dart';
import '../../../../core/utils/validation.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/custom_auth_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKry = GlobalKey<FormState>();
  LoginCubit cubit = getIt();
  bool obsurePassword = true;
  TextEditingController passwordController = TextEditingController(
    text: '!@qwE123',
  );
  TextEditingController emailController = TextEditingController(
    text: 'dfgsadffg344@gmail.com',
  );

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
                  SizedBox(height: height * 0.03),
                  Text(AppStrings.welcomeToRoute, style: AppStyles.sem24White),
                  Text(AppStrings.pleaseSignIn, style: AppStyles.light16White),
                  SizedBox(height: height * 0.032),
                  SingleChildScrollView(
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgetPass,
                          style: AppStyles.reg18White,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  BlocListener<LoginCubit, LoginStates>(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state.loginState.isLoading) {
                        UtilsDialog.showLoading(
                          context: context,
                          content: 'loading...',
                        );
                      } else if (state.loginState.isSuccess) {
                        UtilsDialog.hideDialog(context: context);
                        UtilsDialog.showMessage(
                          context: context,
                          content: 'Login Successfully',
                          title: 'success',
                          posAction: 'ok',
                          posActions: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.homeScreen,
                            );
                          },
                        );
                      } else if (state.loginState.isError) {
                        UtilsDialog.hideDialog(context: context);
                        UtilsDialog.showMessage(
                          context: context,
                          content: state.loginState.errorMessage ?? 'error',
                          title: 'Error',
                          posAction: 'ok',
                        );
                      }
                    },
                    child: CustomElevatedButton(
                      child: Text(AppStrings.login, style: AppStyles.sem20Blue),
                      onTap: () {
                        //todo:login
                        if (_formKry.currentState?.validate() == true) {
                          cubit.login(
                            email: emailController.text,
                            password: passwordController.text,
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
                        AppStrings.dontHaveAccount,
                        style: AppStyles.med18White,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.registerScreen);
                        },
                        child: Text(
                          AppStrings.createAccount,
                          style: AppStyles.med18White,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
