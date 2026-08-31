import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle light18BlackAlpha=GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.blackAlphaColor
  );
  static TextStyle sem24White=GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor
  );
  static TextStyle sem20Blue=GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blueColor
  );
  static TextStyle light16White=GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColors.whiteColor
  );
  static TextStyle med18White=GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor
  );
  static TextStyle reg18White=GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor
  );
}