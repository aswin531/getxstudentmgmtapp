import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool showBorder;
  final EdgeInsets contentPadding;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.showBorder = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            labelText: labelText,
            border: showBorder
                ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                : InputBorder.none,
            contentPadding: contentPadding,
          ),
        ),
      ),
    );
  }
}
