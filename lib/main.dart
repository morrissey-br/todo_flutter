import 'package:todo_flutter/core/infrastructure/TodoGroupRepoSQLite.dart';
import 'package:todo_flutter/theme.dart';
import 'api/domainController.dart';
import 'api/domainPresenter.dart';
import 'pages/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TodoFlutter());
}

final DomainController domainController =
    DomainController.instantiate(TodoGroupRepoSQLite());

final DomainPresenter domainPresenter =
    DomainPresenter.instantiate(TodoGroupRepoSQLite());

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
