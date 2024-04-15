import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studgetx/presentation/controllers/studentcontroller.dart';

class SearchListScreen extends StatelessWidget {
  final StudentController studentController = Get.find();
  SearchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemBuilder: (context, index) {
            final student = studentController.searchResults[index];
            return ListTile(
              title: Obx(() => Text(student.name!.value)),
              subtitle:Obx(() => Text(student.age!.value)),
            );
          },
        ));
  }
}
