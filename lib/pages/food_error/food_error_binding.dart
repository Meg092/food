import 'package:get/get.dart';

import 'food_error_logic.dart';

class FoodErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodErrorLogic());
  }
}
