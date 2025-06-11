import 'package:flutter/material.dart';
import 'package:food_date/db_food/db_food.dart';
import 'package:food_date/pages/food_add/food_add_binding.dart';
import 'package:food_date/pages/food_add/food_add_view.dart';
import 'package:food_date/pages/food_error/food_error_binding.dart';
import 'package:food_date/pages/food_error/food_error_view.dart';
import 'package:food_date/pages/food_first/food_first_binding.dart';
import 'package:food_date/pages/food_first/food_first_view.dart';
import 'package:food_date/pages/food_record/food_record_binding.dart';
import 'package:food_date/pages/food_record/food_record_view.dart';
import 'package:food_date/pages/food_second/food_second_binding.dart';
import 'package:food_date/pages/food_second/food_second_view.dart';
import 'package:food_date/pages/food_tab/food_tab_binding.dart';
import 'package:food_date/pages/food_tab/food_tab_view.dart';
import 'package:get/get.dart';

import 'db_food/db_eng.dart';

Color primaryColor = const Color(0xfff48c51);
Color bgColor = const Color(0xfff7f7f7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBFood().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: DDates,
      initialRoute: '/food',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> DDates = [
  GetPage(name: '/food', page: () => const FoodRecordView(), binding: FoodRecordBinding()),
  GetPage(name: '/food_error', page: () => const FoodErrorView(), binding: FoodErrorBinding()),
  GetPage(name: '/food_tab', page: () => FoodTabPage(), binding: FoodTabBinding()),
  GetPage(name: '/food_le', page: () => DbEng()),
  GetPage(name: '/food_first', page: () => const FoodFirstPage(), binding: FoodFirstBinding()),
  GetPage(name: '/food_second', page: () => FoodSecondPage(), binding: FoodSecondBinding()),
  GetPage(name: '/food_add', page: () => FoodAddPage(), binding: FoodAddBinding()),
];