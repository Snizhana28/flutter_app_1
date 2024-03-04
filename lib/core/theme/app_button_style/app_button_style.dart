import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/consts/consts.dart';
import 'package:flutter_app_1/core/theme/app_colors/app_colors.dart';

abstract class AppButtonStyle {
  static ButtonStyle get active => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.blue),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConst.borderRadius)),
        )),
      );
  static ButtonStyle get disable => active.copyWith(
        backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
      );
}
