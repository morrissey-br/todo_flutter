import 'package:flutter/material.dart';

class AddTodoGroupAlert extends StatefulWidget {
  final void Function(String text) doneCallBack;

  const AddTodoGroupAlert({Key? key, required this.doneCallBack})
      : super(key: key);

  @override
  _AddTodoGroupAlertState createState() => _AddTodoGroupAlertState();
}

class _AddTodoGroupAlertState extends State<AddTodoGroupAlert> {
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
      title: Text('Adicionar novo grupo'),
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
