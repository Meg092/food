import 'package:flutter/material.dart';
import 'package:food_date/main.dart';
import 'package:food_date/pages/food_add/custom_btn.dart';
import 'package:food_date/pages/food_add/food_slider.dart';
import 'package:food_date/pages/food_add/food_text_field.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'food_add_logic.dart';

class FoodAddPage extends GetView<FoodAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<FoodAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: <Widget>[
                              controller.image == null
                                  ? const Icon(
                                      Icons.photo_camera,
                                      size: 40,
                                      color: Color(0xffd0d0d0),
                                    )
                                  : Image.memory(
                                      controller.image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          ).decorated(color: const Color(0xffebebeb)).gestures(
                              onTap: () {
                            controller.imageSelected();
                          }))),
                  Container(
                    color: Colors.transparent,
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'Out time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: IgnorePointer(
                          child: FoodTextField(
                              value: controller.outTimeString,
                              textAlign: TextAlign.end,
                              hintText: 'Select out time',
                              onChange: (_) {}),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  ).gestures(onTap: () {
                    controller.timeSelect(context);
                  }),
                  Divider(
                    height: 15,
                    color: Colors.grey.shade300,
                  ),
                  const Text(
                    'Food type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    CustomBtn(
                      title: 'Cooking',
                      backgroundColor: controller.foodType == 0
                          ? const Color(0xff664e2f)
                          : const Color(0xffebebeb),
                      textColor: controller.foodType == 0
                          ? Colors.white
                          : const Color(0xff6a6a6a),
                    ).gestures(onTap: () {
                      controller.foodType = 0;
                      controller.update();
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomBtn(
                      title: 'Fast',
                      backgroundColor: controller.foodType == 1
                          ? const Color(0xff664e2f)
                          : const Color(0xffebebeb),
                      textColor: controller.foodType == 1
                          ? Colors.white
                          : const Color(0xff6a6a6a),
                    ).gestures(onTap: () {
                      controller.foodType = 1;
                      controller.update();
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomBtn(
                      title: 'Beverage',
                      backgroundColor: controller.foodType == 2
                          ? const Color(0xff664e2f)
                          : const Color(0xffebebeb),
                      textColor: controller.foodType == 2
                          ? Colors.white
                          : const Color(0xff6a6a6a),
                    ).gestures(onTap: () {
                      controller.foodType = 2;
                      controller.update();
                    })
                  ].toRow(),
                  Divider(
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  const Text(
                    'Storage type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    CustomBtn(
                      title: 'Refrigeration',
                      backgroundColor: controller.storageType == 0
                          ? const Color(0xff664e2f)
                          : const Color(0xffebebeb),
                      textColor: controller.storageType == 0
                          ? Colors.white
                          : const Color(0xff6a6a6a),
                    ).gestures(onTap: () {
                      controller.storageType = 0;
                      controller.update();
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomBtn(
                      title: 'Normal',
                      backgroundColor: controller.storageType == 1
                          ? const Color(0xff664e2f)
                          : const Color(0xffebebeb),
                      textColor: controller.storageType == 1
                          ? Colors.white
                          : const Color(0xff6a6a6a),
                    ).gestures(onTap: () {
                      controller.storageType = 1;
                      controller.update();
                    })
                  ].toRow(),
                  Divider(
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  <Widget>[
                    const Text(
                      'Margin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Obx(() {
                      return Text('${controller.margin.value}%');
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      return FoodSlider(controller.margin.value, (v) {
                        controller.margin.value = v;
                      });
                    }),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  Visibility(
                      visible: controller.foodType != 0,
                      child: <Widget>[
                        const Text(
                          'Whether opened or not',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        <Widget>[
                          CustomBtn(
                            title: 'Opened',
                            backgroundColor: controller.used == 0
                                ? const Color(0xff664e2f)
                                : const Color(0xffebebeb),
                            textColor: controller.used == 0
                                ? Colors.white
                                : const Color(0xff6a6a6a),
                          ).gestures(onTap: () {
                            controller.used = 0;
                            controller.update();
                          }),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomBtn(
                            title: 'Unopened',
                            backgroundColor: controller.used == 1
                                ? const Color(0xff664e2f)
                                : const Color(0xffebebeb),
                            textColor: controller.used == 1
                                ? Colors.white
                                : const Color(0xff6a6a6a),
                          ).gestures(onTap: () {
                            controller.used = 1;
                            controller.update();
                          })
                        ].toRow(),
                        Divider(
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                  Container(
                    width: double.infinity,
                    height: 44,
                    alignment: Alignment.center,
                    child: const Text(
                      'Commit',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6))
                      .marginOnly(bottom: 20)
                      .gestures(onTap: () {
                    controller.addData();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
