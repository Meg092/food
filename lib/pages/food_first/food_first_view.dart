import 'package:flutter/material.dart';
import 'package:food_date/pages/food_first/food_item.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'food_first_logic.dart';

class FoodFirstPage extends StatefulWidget {
  const FoodFirstPage({Key? key}) : super(key: key);

  @override
  State<FoodFirstPage> createState() => _FoodFirstPageState();
}

class _FoodFirstPageState extends State<FoodFirstPage>
    with SingleTickerProviderStateMixin {
  FoodFirstLogic controller = Get.find();

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
              child: <Widget>[
            const SizedBox(
              width: 140,
              child: Text(
                'Food date record',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/img0.webp',
              fit: BoxFit.cover,
            )
          ]
                  .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                  .marginSymmetric(horizontal: 25)),
          GetBuilder<FoodFirstLogic>(builder: (_) {
            return SafeArea(
                child: <Widget>[
              Container(
                width: double.infinity,
                child: Theme(
                  data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      useMaterial3: true,
                      tabBarTheme: const TabBarTheme(
                          indicatorColor: Colors.transparent)),
                  child: TabBar(
                    tabAlignment: TabAlignment.fill,
                    controller: tabController,
                    dividerColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    labelPadding: EdgeInsets.zero,
                    labelStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      color: Color(0xff6a6a6a),
                      fontSize: 15,
                    ),
                    indicatorColor: primaryColor,
                    tabs: const [
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Tab(
                            text: "All",
                          )),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Tab(
                            text: "Cooking",
                          )),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Tab(
                            text: "Fast",
                          )),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Tab(
                            text: "Beverage",
                          ))
                    ],
                  ),
                ),
              ).decorated(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FoodItem(controller.allList),
                    FoodItem(controller.firstList),
                    FoodItem(controller.secondList),
                    FoodItem(controller.thirdList),
                  ],
                ),
              ))
            ].toColumn().marginOnly(left: 20, right: 20, top: 150));
          })
        ].toStack(),
      ),
    );
  }
}
