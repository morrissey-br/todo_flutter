class Todo {
  String _id;
  String _text;
  bool _status;

  Todo._(this._id, this._text, this._status);

  static Todo create(
      {required String id, required String todoGroupID, required String text}) {
    return Todo._(id, text, false);
  }

  String get id {
    return _id;
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
