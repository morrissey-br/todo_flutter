import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(TodoFlutter());
}

class TodoFlutter extends StatelessWidget {
  final title = 'Todo Flutter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: this.title),
    );
  }
}
