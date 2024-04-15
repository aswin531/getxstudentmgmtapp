import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studgetx/presentation/controllers/studentcontroller.dart';

class HomePage extends StatelessWidget {
  final StudentController studentController = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: studentController.students.length,
          itemBuilder: (context, index) {
            final student = studentController.students[index];
            return ListTile(
              tileColor: Colors.amber,
              title: Obx(() => Text(student.name!.value)),
              subtitle:Obx(() => Text(student.phone!.value))  
            );
          },
        ));
  }
}
