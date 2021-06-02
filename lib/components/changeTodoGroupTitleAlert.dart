import 'package:flutter/material.dart';

class ChangeTodoGroupTitleAlert extends StatefulWidget {
  final String todoTitle;
  final void Function(String text) doneCallBack;

  const ChangeTodoGroupTitleAlert({Key key, this.todoTitle, this.doneCallBack})
      : super(key: key);

  @override
  _AddTodoAlertState createState() => _AddTodoAlertState();
}

class _AddTodoAlertState extends State<ChangeTodoGroupTitleAlert> {
  TextEditingController _textFieldController;

  @override
  void initState() {
    _textFieldController = TextEditingController(text: widget.todoTitle);
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  changeText(String text) {
    setState(() {
      _textFieldController.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(16.0),
      title: Text('Mudar título'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Defina o título: '),
            TextField(
              autofocus: true,
              controller: _textFieldController,
              onSubmitted: (String value) {
                changeText(value);
                widget.doneCallBack(_textFieldController.text);
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Salvar'),
          onPressed: () {
            widget.doneCallBack(_textFieldController.text);
          },
        ),
      ],
    );
  }
}
