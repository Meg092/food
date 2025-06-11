import 'package:get/get.dart';

import 'food_first_logic.dart';

class FoodFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodFirstLogic());
  }
}
