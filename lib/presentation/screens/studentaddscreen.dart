// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studgetx/presentation/widgets/addbutton.dart';
import 'package:studgetx/presentation/widgets/customappbar.dart';
import 'package:studgetx/presentation/widgets/imgcontainer.dart';
import 'package:studgetx/presentation/widgets/textformfield.dart';
import 'package:studgetx/repository/imagepickservices.dart';

class StudentAddScreen extends StatelessWidget {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final Rx<File?> imageFile = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await _imagePickerService.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile.value = pickedImage;
      print('Image picked from gallery : ${imageFile.value?.path}');
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage =
        await _imagePickerService.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile.value = pickedImage;
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
                Obx(
                  () => ImageWithFloatingActionButton(
                    imagePath:
                        imageFile.value?.path,
                    onPressed: () => pickImageFromGallery(),
                  ),
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
