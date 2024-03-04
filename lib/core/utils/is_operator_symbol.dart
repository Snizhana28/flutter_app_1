import 'package:flutter_app_1/core/consts/consts.dart';

bool isSubOperator(String input) {
  if (input == AppConst.operatorDelete ||
      input == '%' ||
      input == AppConst.module ||
      input == 'C') {
    return true;
  } else {
    return false;
  }
}
