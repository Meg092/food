import 'package:get/get.dart';

import 'food_add_logic.dart';

class FoodAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodAddLogic());
  }
}
