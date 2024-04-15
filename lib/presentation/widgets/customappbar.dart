import 'package:flutter/material.dart';
import 'package:studgetx/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:white,
      title: Row(
        children: [
          IconButton(
            icon:const Icon(Icons.arrow_back_ios),
            onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          ),
          Text(title),
        ],
      ),
    );
  }
}
