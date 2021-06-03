import 'package:flutter/material.dart';

class AddTodoAlert extends StatefulWidget {
  final void Function(String text) doneCallBack;

  const AddTodoAlert({Key? key, required this.doneCallBack}) : super(key: key);

  @override
  _AddTodoAlertState createState() => _AddTodoAlertState();
}

class _AddTodoAlertState extends State<AddTodoAlert> {
  String _textField = '';

  changeText(String text) {
    setState(() {
      _textField = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(16.0),
      title: Text('Adicionar todo'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Defina o nome: '),
            TextField(
              autofocus: true,
              onChanged: (String value) {
                changeText(value);
              },
              onSubmitted: (String value) {
                changeText(value);
                widget.doneCallBack(_textField);
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            widget.doneCallBack(_textField);
          },
        ),
      ],
    );
  }
}
