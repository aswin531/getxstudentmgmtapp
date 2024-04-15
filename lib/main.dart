import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studgetx/domain/models/studentmodel.dart';
import 'package:studgetx/presentation/controllers/studentcontroller.dart';
import 'package:studgetx/presentation/screens/firstscreen.dart';
import 'package:studgetx/presentation/screens/loginview.dart';
import 'package:studgetx/presentation/screens/splashscreen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  Get.put(StudentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyApp(),
        ),
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/firstmain',
          page: () => const FirstMainScreen(),
        ),
      ],
      home: const SplashScreen(),
    );
  }
}
