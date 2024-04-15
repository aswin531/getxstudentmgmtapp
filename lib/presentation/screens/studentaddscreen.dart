import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studgetx/presentation/widgets/addbutton.dart';
import 'package:studgetx/presentation/widgets/customappbar.dart';
import 'package:studgetx/presentation/widgets/textformfield.dart';
import 'package:studgetx/repository/imagepickservices.dart';

class StudentAddScreen extends StatelessWidget {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final Rx<File?> imageFile = Rx<File?>(null);
  void pickImage() async {
    final imageFile = await _imagePickerService.pickImage();
    if (imageFile != null) {
      // imageFile.value = imageFile;
    }
  }

  StudentAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: "Add student"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset("assets/images/profile.png"),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        splashColor: Colors.green,
                        backgroundColor: Colors.white54,
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomTextFormField(
                    labelText: 'Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person_pin_circle_rounded,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      labelText: 'Age',
                      prefixIcon: Icons.format_list_numbered_outlined),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    labelText: 'Phone',
                    prefixIcon: Icons.phone,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomTextFormField(
                    keyboardType: TextInputType.text,
                    labelText: 'Address',
                    prefixIcon: Icons.location_on_outlined,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AddButton(
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
