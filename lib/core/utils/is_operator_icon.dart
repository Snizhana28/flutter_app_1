import 'package:flutter_app_1/core/consts/consts.dart';

bool isOperatorIcon(String input) {
  if (input == AppConst.module || input == AppConst.operatorDelete) {
    return true;
  } else {
    return false;
  }
}
