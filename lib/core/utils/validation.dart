import 'package:flutter/cupertino.dart';

class Validation {
  static String? validateName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Enter Your Name';
    }

    final regx = RegExp(r'^[a-zA-Z ]+$');

    if (!regx.hasMatch(text.trim())) {
      return 'Enter a Valid Name';
    }

    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Enter Your Password';
    } else {
      bool regx = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$',
      ).hasMatch(text);
      if (regx) {
        return null;
      } else {
        return 'Enter Valid Password';
      }
    }
  }

  static String? validateFullName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Enter Your Full Name';
    }

    final regx = RegExp(r'^[a-zA-Z ]+$');

    if (!regx.hasMatch(text.trim())) {
      return 'Enter a Valid Full Name';
    }

    return null;
  }

  static String? validateMobileNum(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Enter Your Mobile Number';
    }
    if (text.length != 11) {
      return 'Please Enter Correct Mobile Number';
    }
    return null;
  }

  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Enter Your Email";
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  static String? rePasswordValidator(
    String? text,
    TextEditingController passwordController,
  ) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter confirmPassword';
    }
    if (text != passwordController.text) {
      return "rePassword doesn't match password";
    }
    return null;
  }
}
