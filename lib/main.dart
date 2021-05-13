import 'package:flutter/material.dart';
import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/theme.dart';
import 'pages/homePage.dart';
import 'pages/todoGroupEditPage.dart';

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
      home: TodoGroupEditPage(
        todoGroup: MemoryTodoGroupsDatabase().getByIndex(0),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
