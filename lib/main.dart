import 'package:flutter/material.dart';
import 'package:todo_flutter/theme.dart';

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
        textTheme: customTextTheme,
        iconTheme: customIconThemeData,
        appBarTheme: customAppBarTheme,
      ),
      home: Home(title: 'Hello.'),
      debugShowCheckedModeBanner: false,
    );
  }
}
