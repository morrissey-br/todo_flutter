import 'package:todo_flutter/services/userServices.dart';
import 'package:todo_flutter/theme.dart';
import 'pages/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TodoFlutter());
}

final UserServices userServices = UserServices.instance();

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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
