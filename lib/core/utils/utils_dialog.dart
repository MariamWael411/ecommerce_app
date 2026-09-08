import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_config.dart';

class UtilsDialog {
  static void showLoading({
    required BuildContext context,
    required String content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          content: Row(
            spacing: AppConfig.width(context) * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppColors.blueColor),
              Text(content, style: AppStyles.bold20Blue),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String content,
    required String title,
    String? posAction,
    String? negAction,
    VoidCallback? negActions,
    VoidCallback? posActions,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if (posAction != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                posActions?.call();
              },
              child: Text(posAction, style: AppStyles.reg16Blue),
            ),
          );
        }
        if (negAction != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                negActions?.call();
              },
              child: Text(negAction, style: AppStyles.reg16Blue),
            ),
          );
        }
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          content: Text(content, style: AppStyles.bold20Blue),
          title: Text(title, style: AppStyles.reg16Blue),
          actions: actions,
        );
      },
    );
  }
}
