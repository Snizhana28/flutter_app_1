import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/theme/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle get buttonText => GoogleFonts.workSans(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: TextColors.black,
      );
  static TextStyle get displayText => GoogleFonts.workSans(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        color: TextColors.black,
      );
}
