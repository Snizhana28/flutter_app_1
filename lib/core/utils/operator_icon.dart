import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/consts/consts.dart';
import 'package:flutter_app_1/core/icons/app_icons_icons.dart';

IconData operatorIcon(String input) {
  if (input == AppConst.module) {
    return AppIcons.plusMinus;
  } else if (input == AppConst.operatorDelete) {
    return AppIcons.delete;
  } else {
    throw Exception();
  }
}
