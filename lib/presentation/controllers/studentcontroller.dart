// ignore_for_file: avoid_print
import 'dart:async';
import 'package:get/get.dart';
import 'package:studgetx/domain/models/studentmodel.dart';
import 'package:studgetx/repository/boxrepository.dart';

class StudentController extends GetxController {
  var students = <StudentModel>[].obs; // made observe student list
  var searchResults = <StudentModel>[].obs;
  late Timer _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    loadStudents(); // Load students from Hive box when the controller is initialized
  }

  void loadStudents() async {
    try {
      final box = await BoxRepository.openBox();
      students.assignAll(box.values.toList());
    } catch (e) {
      print("Error loading Students: $e");
    }
  }

  void addStudent(StudentModel student) async {
    try {
      final box = await BoxRepository.openBox();
      await box.add(student);
      students.add(student);
    } catch (e) {
      print("Error adding : $e");
    }
  }

  void updateStudent(int index, StudentModel updatedStudent) async {
    try {
      final box = await BoxRepository.openBox();
      await box.putAt(index, updatedStudent);
      students[index] = updatedStudent;
    } catch (e) {
      print("Error Updating : $e");
    }
  }

  void deleteStudent(int index) async {
    try {
      final box = await BoxRepository.openBox();
      await box.deleteAt(index);
      students.removeAt(index);
    } catch (e) {
      print("Error Deleting : $e");
    }
  }

  void searchStudent(String query) {
    if (_debounceTimer.isActive) {
      _debounceTimer.cancel();
    }
    _debounceTimer = Timer(const Duration(microseconds: 300), () {
      //creating a new timer
      searchResults.clear(); // Clear previous search results
      if (query.isEmpty) {
        searchResults.assignAll(students); // showing ALLSTUDENTS
      } else {
        final filterStudents = students
            .where((student) =>
                student.name?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList();
        searchResults.assignAll(filterStudents);
      }
    });
  }

  @override
  void onClose() {
    BoxRepository.closeBox();
    super.onClose();
  }
}
