import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/consts/consts.dart';
import 'package:flutter_app_1/core/theme/app_button_style/app_button_style.dart';
import 'package:flutter_app_1/core/theme/app_colors/app_colors.dart';
import 'package:flutter_app_1/core/theme/app_text_style/app_text_style.dart';
import 'package:flutter_app_1/core/utils/color_button.dart';
import 'package:flutter_app_1/core/utils/is_operator_icon.dart';
import 'package:flutter_app_1/core/utils/is_operator_symbol.dart';
import 'package:flutter_app_1/core/utils/operator_icon.dart';
import 'package:flutter_app_1/feature/presentation/screens/domain/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 100,
                        child: AutoSizeText(
                          controller.result.value,
                          textAlign: TextAlign.end,
                          style: AppTextStyle.displayText,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: AppConst.buttons.length,
                      itemBuilder: (context, index) {
                        final buttonText = AppConst.buttons[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              final number = num.tryParse(buttonText);
                              if (number != null) {
                                controller.numberChanged(number.toString());
                              } else if (buttonText == '.') {
                                if (controller.operator.value.isEmpty) {
                                  controller.numberChanged(buttonText);
                                } else {
                                  controller.numberChanged(buttonText);
                                }
                              } else {
                                if (buttonText == '=') {
                                  controller.calculate();
                                } else if (isSubOperator(buttonText)) {
                                  controller.subOperatorChanged(buttonText);
                                  controller.calculate();
                                } else {
                                  controller.operatorChanged(buttonText);
                                }
                              }
                            },
                            style: AppButtonStyle.active.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                colorButton(buttonText),
                              ),
                            ),
                            child: isOperatorIcon(buttonText)
                                ? Icon(
                                    operatorIcon(buttonText),
                                    color: TextColors.black,
                                    size: 32,
                                  )
                                : Text(
                                    buttonText,
                                    style: AppTextStyle.buttonText.copyWith(
                                      color: colorButton(buttonText) ==
                                              AppColors.blue
                                          ? TextColors.white
                                          : TextColors.black,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
