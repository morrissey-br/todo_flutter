import 'package:todo_flutter/core/domain/concepts/Entity.dart';

class Todo extends Entity<Todo> {
  String _text;
  String _todoGroupID;
  bool _status;

  Todo.create(
      {required String id, required String todoGroupID, required String text})
      : this._todoGroupID = todoGroupID,
        this._text = text,
        this._status = false,
        super(id);

  Todo.rebuild(
      {required String id,
      required String todoGroupID,
      required String text,
      required bool status})
      : this._todoGroupID = todoGroupID,
        this._text = text,
        this._status = status,
        super(id);

  String get text {
    return _text;
  }

  String get todoGroupID {
    return _todoGroupID;
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
