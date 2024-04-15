import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studgetx/presentation/screens/firstscreen.dart';
import 'package:studgetx/presentation/widgets/loginbutton.dart';
import 'package:studgetx/presentation/widgets/textformfield.dart';
import 'package:studgetx/utils/colors.dart';
import 'package:studgetx/utils/styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
      ),
      body: Container(
        decoration: BoxDecoration(color: white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/login2bg.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Login",
                            style: TextStyles.heading,
                          ),
                        ),
                        const Text(
                          "Welcome Back",
                          style: TextStyles.subheading,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const CustomTextFormField(
                          labelText: "Username",
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.numberWithOptions(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          labelText: "Password",
                          prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: LoginButton(
                            height: 50.0,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            borderRadius: 10.0,
                            onPressed: () {
                              Get.offAll(() => const FirstMainScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
