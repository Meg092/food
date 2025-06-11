import 'package:flutter/material.dart';
import 'package:food_date/pages/food_add/food_add_view.dart';
import 'package:food_date/pages/food_first/food_first_logic.dart';
import 'package:food_date/pages/food_first/food_first_view.dart';
import 'package:food_date/pages/food_second/food_second_view.dart';
import 'package:get/get.dart';

import 'food_tab_logic.dart';

class FoodTabPage extends GetView<FoodTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [FoodFirstPage(),FoodAddPage(),FoodSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navFoodBars()),
    );
  }

  Widget _navFoodBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item2Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item2Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Mine',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/food_add')?.then((_) {
              FoodFirstLogic firstLogic = Get.find();
              firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
