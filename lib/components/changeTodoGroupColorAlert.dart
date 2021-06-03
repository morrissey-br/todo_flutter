import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ChangeTodoGroupColorAlert extends StatefulWidget {
  final int todoColor;
  final void Function({required int newColor}) doneCallBack;

  const ChangeTodoGroupColorAlert(
      {Key? key, required this.todoColor, required this.doneCallBack})
      : super(key: key);

  @override
  _AddTodoAlertState createState() => _AddTodoAlertState();
}

class _AddTodoAlertState extends State<ChangeTodoGroupColorAlert> {
  late Color selectedColor;

  @override
  void initState() {
    selectedColor = Color(widget.todoColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(16.0),
      title: Text('Mudar cor'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Selecione a cor: '),
            ColorPicker(
              color: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              enableShadesSelection: false,
              pickersEnabled: {
                ColorPickerType.accent: false,
              },
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Salvar'),
          onPressed: () {
            widget.doneCallBack(newColor: selectedColor.value);
          },
        ),
      ],
    );
  }
}
