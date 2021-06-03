import 'package:flutter/material.dart';

class ConfirmDeleteTodoAlert extends StatefulWidget {
  final void Function({required bool confirm}) doneCallBack;

  const ConfirmDeleteTodoAlert({Key? key, required this.doneCallBack})
      : super(key: key);

  @override
  _ConfirmDeleteTodoAlertState createState() => _ConfirmDeleteTodoAlertState();
}

class _ConfirmDeleteTodoAlertState extends State<ConfirmDeleteTodoAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(16.0),
      title: Text('Deseja realmente deletar esse todo?'),
      actions: <Widget>[
        TextButton(
          child: Text('Não'),
          onPressed: () {
            widget.doneCallBack(confirm: false);
          },
        ),
        TextButton(
          child: Text('Sim'),
          onPressed: () {
            widget.doneCallBack(confirm: true);
          },
        ),
      ],
    );
  }
}
