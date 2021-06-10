import 'package:todo_flutter/services/UUIDGenerator.dart';
import 'package:todo_flutter/services/database/OnMemoryListDatabase.dart';
import 'package:todo_flutter/core/gateways/DBContext.dart';
import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:todo_flutter/api/domainController.dart';
import 'package:todo_flutter/api/domainPresenter.dart';
import 'package:todo_flutter/theme.dart';
import 'pages/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TodoFlutter());
}

final DBContext dbContext = OnMemoryListDBContext();
final IDGenerator idGenerator = UUIDGenerator();

final DomainController domainController =
    DomainController.instantiate(dbContext, idGenerator);

final DomainPresenter domainPresenter =
    DomainPresenter.instantiate(dbContext, idGenerator);

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
