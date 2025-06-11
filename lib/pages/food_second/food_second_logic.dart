import 'package:flutter/material.dart';
import 'package:food_date/db_food/db_food.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../food_first/food_first_logic.dart';

class FoodSecondLogic extends GetxController {

  DBFood dbFood = Get.find();

  var appVersion = '1.0'.obs;

  cleanFoodData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbFood.cleanFoodData();
            FoodFirstLogic firstLogic = Get.find();
            firstLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    var info = await PackageInfo.fromPlatform();
    appVersion.value = info.version;
    super.onInit();
  }

}
