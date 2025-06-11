import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_date/db_food/db_food.dart';
import 'package:food_date/db_food/food_entity.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FoodAddLogic extends GetxController {
  DBFood dbFood = Get.find();

  Uint8List? image;

  DateTime? outTime;
  String outTimeString = '';
  int foodType = 1;
  int storageType = 0;
  var margin = 100.obs;
  int used = 0;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(imageQuality: 90,maxWidth: 1024,source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void timeSelect(BuildContext context) {
    DatePicker.showDatePicker(context,dateFormat: 'MM/dd/yyyy',onConfirm: (date,list) {
      outTime = DateTime(date.year, date.month, date.day,);
      outTimeString  = DateFormat('MM/dd/yyyy').format(outTime!);
      update();
    });
  }

  void addData() async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    if (outTime == null) {
      Fluttertoast.showToast(msg: 'Please select an out time');
      return;
    }
    await dbFood.insertFood(FoodEntity(
        id: 0,
        createdTime: DateTime.now(),
        image: image!,
        outTime: outTime!,
        foodType: foodType,
        storageType: storageType,
        margin: margin.value,
        used: used));
    Fluttertoast.showToast(msg: 'Added successfully');
    Get.back();
  }
}
