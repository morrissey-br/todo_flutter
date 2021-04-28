import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(TodoFlutter());
}

class TodoFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Flutter',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: GoogleFonts.montserrat(
                  textStyle: ThemeData.light()
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 30)),
            ),
      ),
      home: Home(title: 'Hello.'),
    );
  }
}
