import 'package:flutter_app_1/core/consts/consts.dart';
import 'package:flutter_app_1/core/extensions/string_extension.dart';
import 'package:get/get.dart';

enum CurrentActiveNumber {
  firstNumber,
  secondNumber,
}

class CalculatorController extends GetxController {
  final RxString result = '0'.obs;
  final RxString firstNumber = '0'.obs;
  final RxString secondNumber = '0'.obs;
  final RxString operator = 'init'.obs;
  final RxString subOperator = ''.obs;
  CurrentActiveNumber activeNumber = CurrentActiveNumber.firstNumber;

  void calculate() {
    if (subOperator.value == '') {
      switch (operator.value) {
        case '+':
          result.value =
              (num.parse(firstNumber.value) + num.parse(secondNumber.value))
                  .toString();
          break;
        case '-':
          result.value =
              (num.parse(firstNumber.value) - num.parse(secondNumber.value))
                  .toString();
          break;
        case '×':
          result.value =
              (num.parse(firstNumber.value) * num.parse(secondNumber.value))
                  .toString();
          break;
        case '÷':
          if (num.tryParse(secondNumber.value) != 0) {
            result.value =
                (num.parse(firstNumber.value) / num.parse(secondNumber.value))
                    .toString();
          } else {
            result.value = 'Помилка';
            secondNumber.value = '0';
            firstNumber.value = '0';
          }
          break;
      }
      operator.value = '';
      secondNumber.value = '0';
      firstNumber.value = result.value.toString();
      activeNumber = CurrentActiveNumber.firstNumber;
      update();
    } else {
      switch (subOperator.value) {
        case 'C':
          secondNumber.value = '0';
          firstNumber.value = '0';
          result.value = '0';
          operator.value = '';
          break;
        case '%':
          String number;
          if (activeNumber == CurrentActiveNumber.firstNumber) {
            number = firstNumber.value.numberPercent();
            firstNumber.value = number;
          } else {
            number = secondNumber.value.numberPercent();
            secondNumber.value = number;
          }
          result.value = number;
          break;
        case AppConst.module:
          String number;
          if (activeNumber == CurrentActiveNumber.firstNumber) {
            number = firstNumber.value.numberPlusMinus();
            firstNumber.value = number;
          } else {
            number = secondNumber.value.numberPlusMinus();
            secondNumber.value = number;
          }
          result.value = number;
          break;
        case AppConst.operatorDelete:
          String number;
          if (activeNumber == CurrentActiveNumber.firstNumber) {
            number = firstNumber.value.removeLastCharacter();
            firstNumber.value = number;
          } else {
            number = secondNumber.value.removeLastCharacter();
            secondNumber.value = number;
          }
          result.value = number;
          break;
      }
      subOperator.value = '';
      update();
    }
  }

  void numberChanged(String input) {
    RxString activeValue = ''.obs;

    if (activeNumber == CurrentActiveNumber.firstNumber) {
      if (operator.value == '') {
        activeValue.value = '0';
      } else {
        activeValue = firstNumber;
      }
    } else {
      activeValue = secondNumber;
    }

    if (input == '.') {
      if (!activeValue.value.contains('.')) {
        activeValue.value += input;
      }
    } else {
      if (activeValue.value == '0' || result.value == 'Помилка') {
        activeValue.value = input;
      } else {
        activeValue.value += input;
      }
    }

    result.value = activeValue.value.toString();
    if (activeNumber == CurrentActiveNumber.firstNumber) {
      firstNumber.value = activeValue.value;
    } else {
      secondNumber.value = activeValue.value;
    }

    print(
        '${activeNumber == CurrentActiveNumber.firstNumber ? 'firstNumber' : 'secondNumber'} ${activeValue.value.toString()}');
    update();
  }

  void operatorChanged(String input) {
    activeNumber = CurrentActiveNumber.secondNumber;
    operator.value = input;
    update();
    print('operator ${operator.value.toString()}');
  }

  void subOperatorChanged(String input) {
    subOperator.value = input;
    update();
    print('SubOperator ${subOperator.value.toString()}');
  }

  @Deprecated('please use numberChanged')
  void firstNumberChanged(String input) {
    activeNumber = CurrentActiveNumber.firstNumber;
    if (input == '.') {
      if (!firstNumber.value.contains('.')) {
        firstNumber.value += input;
      }
    } else {
      if (firstNumber.value == '0' || result.value == 'Помилка') {
        firstNumber.value = input;
      } else {
        firstNumber.value += input;
      }
    }
    result.value = firstNumber.value.toString();
    update();
  }

  @Deprecated('please use numberChanged')
  void secondNumberChanged(String input) {
    if (input == '.') {
      if (!secondNumber.value.contains('.')) {
        secondNumber.value += input;
      }
    } else {
      if (secondNumber.value == '0' || result.value == 'Помилка') {
        secondNumber.value = input;
      } else {
        secondNumber.value += input;
      }
    }
    result.value = secondNumber.value.toString();
    update();
  }
}
