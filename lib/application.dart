import 'package:flutter/material.dart';
import 'package:flutter_app_1/core/router/router.dart';
import 'package:flutter_app_1/core/theme/app_colors/app_colors.dart';
import 'package:flutter_app_1/feature/presentation/screens/calculator/calculator_screen.dart';
import 'package:flutter_app_1/core/utils/bindings.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      initialBinding: ControllerBinds(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        useMaterial3: true,
      ),
      initialRoute: AppRouter.calculator,
      getPages: [
        GetPage(
            name: AppRouter.calculator, page: () => const CalculatorScreen()),
      ],
    );
  }
}
