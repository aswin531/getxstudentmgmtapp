import 'dart:io';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject{
  @HiveField(0)
  RxString? name = "".obs;
  @HiveField(1)
  RxString? age = "".obs;
  @HiveField(2)
  RxString? phone = "".obs;
  @HiveField(3)
  RxString? address = "".obs;
  @HiveField(4)
  Rx<File?> imagePath = Rx<File?>(null);
  StudentModel({
     required String name,
    required String age,
    required String phone,
    required String address,
    required File? imagePath,
  }) {
this.name!.value = name;
    this.age!.value = age;
    this.phone!.value = phone;
    this.address!.value = address;
    this.imagePath.value = imagePath;
  }
}
