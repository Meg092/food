import 'dart:typed_data';

import 'package:intl/intl.dart';

class FoodEntity {
  int id;
  DateTime createdTime;
  Uint8List image;
  DateTime outTime;
  int foodType;
  int storageType;
  int margin;
  int used;

  FoodEntity({
    required this.id,
    required this.createdTime,
    required this.image,
    required this.outTime,
    required this.foodType,
    required this.storageType,
    required this.margin,
    required this.used,
  });

  factory FoodEntity.fromJson(Map<String, dynamic> json) {
    return FoodEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      image: json['image'],
      outTime: DateTime.parse(json['outTime']),
      foodType: json['foodType'],
      storageType: json['storageType'],
      margin: json['margin'],
      used: json['used'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'image': image,
      'outTime': outTime.toIso8601String(),
      'foodType': foodType,
      'storageType': storageType,
      'margin': margin,
      'used': used,
    };
  }

  bool get isExpired {
    final now = DateTime.now();
    if (outTime.isBefore(now)) {
      return true;
    } else{
      final days = outTime.difference(now).inDays;
      if (days <= 6) {
        return true;
      } else {
        return false;
      }
    }
  }

  String get outTimeString {
    final now = DateTime.now();
    if (outTime.isBefore(now)) {
      return 'Expired';
    } else{
      final days = outTime.difference(now).inDays;
      if (days <= 6) {
        return '$days days left';
      } else {
        return DateFormat('MM/dd/yyyy').format(outTime);
      }
    }
  }
}