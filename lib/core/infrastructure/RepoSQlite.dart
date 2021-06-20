import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/core/domain/concepts/Repository.dart';
import 'package:todo_flutter/core/infrastructure/TodoRepoSQLite.dart';

import 'TodoGroupRepoSQLite.dart';

abstract class RepoSQLite<T> implements Repository<T> {
  late Database _db;
  String _dbName = 'todo.db';
  bool initialized = false;

  Future<void> _init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 7,
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute('DROP TABLE IF EXISTS todoGroups');
        db.execute('DROP TABLE IF EXISTS todos');
        db.execute(TodoRepoSQLite.createTableSQL());
        db.execute(TodoGroupRepoSQLite.createTableSQL());
      },
    );
  }

  Future<Database> db() async {
    if (!initialized) {
      await _init();
    }
    return _db;
  }
}
