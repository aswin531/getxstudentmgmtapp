import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studgetx/presentation/screens/loginview.dart';
import 'package:studgetx/utils/colors.dart';
import 'package:studgetx/utils/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 400,
        backgroundColor: white,
        nextScreen: const LoginPage(),
        splash: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: LottieBuilder.asset("assets/lottie/old.json"),
            ),
            const SizedBox(height: 20),
             Text(
              'Welcome To Our App',
              style:TextStyles.heading
            ),
          ],
        ),
      ),
    );
  }
}
