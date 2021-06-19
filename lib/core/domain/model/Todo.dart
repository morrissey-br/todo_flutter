import 'package:todo_flutter/core/domain/concepts/Entity.dart';

class Todo extends Entity<Todo> {
  String _text;
  bool _status;

  Todo._(String _id, this._text, this._status) : super(_id);

  static Todo create(
      {required String id, required String todoGroupID, required String text}) {
    return Todo._(id, text, false);
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo._(map['id'], map['text'], map['status']);
  }

  String get text {
    return _text;
  }

  bool get status {
    return _status;
  }

  void changeStatus() {
    _status = !_status;
  }

  void edit(String text) {
    _text = text;
  }
}
