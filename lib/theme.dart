import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme customTextTheme = GoogleFonts.montserratTextTheme().copyWith(
  headline4: TextStyle(
    fontWeight: FontWeight.w500,
  ),
);

IconThemeData customIconThemeData = IconThemeData(
  color: Colors.grey.shade400,
  size: 32,
);

AppBarTheme customAppBarTheme = AppBarTheme(
  backwardsCompatibility: false,
  color: Colors.transparent,
  foregroundColor: Colors.grey.shade400,
  elevation: 0,
  titleTextStyle: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  ),
);
