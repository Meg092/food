import 'package:get/get.dart';

import 'food_record_logic.dart';

class FoodRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      FoodRecordLogic(),
      permanent: true,
    );
  }
}
