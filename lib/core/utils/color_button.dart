import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/theme/app_colors/app_colors.dart';

Color colorButton(String input) {
  if (input == 'C' || input == 'operator_plus_minus' || input == '%') {
    return AppColors.gray;
  } else if (input == '×' ||
      input == '÷' ||
      input == '×' ||
      input == '-' ||
      input == '=' ||
      input == '+') {
    return AppColors.blue;
  } else {
    return AppColors.white;
  }
}
