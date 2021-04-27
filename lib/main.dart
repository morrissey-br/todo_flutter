import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(TodoFlutter());
}

class TodoFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Flutter',
      home: Home(title: 'Hello.'),
    );
  }
}
