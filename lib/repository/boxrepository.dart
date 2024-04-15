// ignore_for_file: avoid_print

import 'package:hive/hive.dart';
import 'package:studgetx/domain/models/studentmodel.dart';

class BoxRepository {
  static String boxName = "studentBox";
  static Future<Box<StudentModel>> openBox() async {
    try {
      return await Hive.openBox<StudentModel>(boxName);
    } catch (e) {
      print("Error opening box: $e");
      rethrow;
    }
  }

  static Box<StudentModel> getBox() {
    try {
      return Hive.box<StudentModel>(boxName);
    } catch (e) {
      print("Error getting box : $e");
      rethrow;
    }
  }

  static Future<void> closeBox() async {
    try {
      await Hive.close();
    } catch (e) {
      print("Error closing box: $e");
      rethrow;
    }
  }
}
