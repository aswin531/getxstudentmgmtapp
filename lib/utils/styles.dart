import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studgetx/utils/colors.dart';

class TextStyles {
  static final TextStyle heading = GoogleFonts.openSans(
      fontSize: 36, fontWeight: FontWeight.w500, color: textColor);

  static const TextStyle subheading = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );
  static const TextStyle search = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );
}
