import 'dart:io';

import 'package:flutter/material.dart';

class ImageWithFloatingActionButton extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onPressed;

  const ImageWithFloatingActionButton({
    super.key,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: imagePath != null &&
                    imagePath!
                        .isNotEmpty 
                ? Image.file(File(imagePath!))
                : Image.asset('assets/images/profile.png'),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: onPressed ?? () {},
            mini: true,
            splashColor: Colors.green,
            backgroundColor: Colors.white54,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
