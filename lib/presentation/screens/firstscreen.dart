import 'package:flutter/material.dart';
import 'package:studgetx/presentation/widgets/homescreen.dart';
import 'package:studgetx/presentation/widgets/searchbar.dart';
import 'package:studgetx/utils/colors.dart';
import 'package:studgetx/utils/styles.dart';

class FirstMainScreen extends StatelessWidget {
  const FirstMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          toolbarHeight: 10,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarScreen(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 25),
              child: Text(
                "Student List ",
                style: TextStyles.heading,
              ),
            ),
            Expanded(child: HomePage())
          ],
        ));
  }
}
