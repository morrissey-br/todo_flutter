import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme() {
  return ThemeData(
    textTheme: ThemeData.light().textTheme.copyWith(
          headline4: GoogleFonts.montserrat(
            textStyle:
                ThemeData.light().textTheme.headline4.copyWith(fontSize: 30),
          ),
          headline6: GoogleFonts.montserrat(
            textStyle:
                ThemeData.light().textTheme.headline6.copyWith(fontSize: 16),
          ),
        ),
  );
}
