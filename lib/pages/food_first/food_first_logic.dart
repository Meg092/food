import 'package:food_date/db_food/db_food.dart';
import 'package:food_date/db_food/food_entity.dart';
import 'package:get/get.dart';

class FoodFirstLogic extends GetxController {

  DBFood dbFood = Get.find();

  var allList = <FoodEntity>[];
  var firstList = <FoodEntity>[];
  var secondList = <FoodEntity>[];
  var thirdList = <FoodEntity>[];

  void getData() async {
    allList = await dbFood.getFoodAllData();
    firstList = allList.where((element) => element.foodType == 0).toList();
    secondList = allList.where((element) => element.foodType == 1).toList();
    thirdList = allList.where((element) => element.foodType == 2).toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
