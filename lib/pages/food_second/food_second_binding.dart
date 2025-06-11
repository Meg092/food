import 'package:get/get.dart';

import 'food_second_logic.dart';

class FoodSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodSecondLogic());
  }
}
