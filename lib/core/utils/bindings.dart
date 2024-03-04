import 'package:flutter_app_1/feature/presentation/screens/domain/calculator_controller.dart';
import 'package:get/get.dart';
class ControllerBinds implements Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController());
  }
}
