
import 'package:food_date/db_food/food_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBFood extends GetxService {
  late Database dbBase;

  Future<DBFood> init() async {
    await createFoodDB();
    return this;
  }

  createFoodDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'food.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createFoodTable(db);
        });
  }

  createFoodTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS food (id INTEGER PRIMARY KEY, createdTime TEXT, image BLOB, outTime TEXT, foodType INTEGER, storageType INTEGER, margin INTEGER, used INTEGER)');
  }

  insertFood(FoodEntity entity) async {
    final id = await dbBase.insert('food', {
      'createdTime': entity.createdTime.toIso8601String(),
      'image': entity.image,
      'outTime': entity.outTime.toIso8601String(),
      'foodType': entity.foodType,
      'storageType': entity.storageType,
      'margin': entity.margin,
      'used': entity.used,
    });
    return id;
  }

  cleanFoodData() async {
    await dbBase.delete('food');
  }

  Future<List<FoodEntity>> getFoodAllData() async {
    var result = await dbBase.query('food', orderBy: 'outTime DESC');
    return result.map((e) => FoodEntity.fromJson(e)).toList();
  }
}
