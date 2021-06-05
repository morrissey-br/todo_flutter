import 'package:flutter/material.dart';
import 'package:todo_flutter/components/backgroundMessage.dart';
import 'package:todo_flutter/components/todoComponent.dart';
import 'package:todo_flutter/main.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/pages/todoGroupEditPage.dart';

class TodoGroupComponent extends StatefulWidget {
  final int index;
  final String todoGroupID;
  final bool isLast;

  const TodoGroupComponent(
      {Key? key,
      required this.index,
      required this.todoGroupID,
      required this.isLast})
      : super(key: key);

  @override
  _TodoGroupComponentState createState() => _TodoGroupComponentState();
}

class _TodoGroupComponentState extends State<TodoGroupComponent>
    with TickerProviderStateMixin {
  late TodoGroup todoGroup;
  bool isOpen = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    todoGroup = userServices.getTodoGroupByID(widget.todoGroupID);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
      reverseCurve: Curves.easeOut,
    );
    super.initState();

    if (widget.isLast) {
      isOpen = true;
    }

    if (isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // FIXME: Estuda isso aqui q eu nem sei como funciona...
  // FIXME: Aprendi no link: https://medium.com/sk-geek/flutter-experiment-to-trigger-animation-when-parent-setstate-84e949530b64
  // @override
  // void didUpdateWidget(TodoGroupComponent oldTodoGroupComponent) {
  //   if (isOpen) {
  //     _controller.forward();
  //   } else {
  //     _controller.reverse();
  //   }
  //   super.didUpdateWidget(oldTodoGroupComponent);
  // }

  void _openClose() {
    if (widget.isLast) {
      return;
    }
    setState(() {
      isOpen = !isOpen;
    });
    if (isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _markTodoStatus({required String todoID}) {
    userServices.markTodoState(todoGroupID: todoGroup.id, todoID: todoID);
    setState(() {
      todoGroup = userServices.getTodoGroupByID(todoGroup.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.grey.shade300,
                offset: Offset(0, -2),
              )
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _openClose,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      todoGroup.title,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Color(todoGroup.color),
                          ),
                    ),
                  ),
                ),
              ),
              // O efeito do Inkwell contido no IconButton é desenhado no widget Material (que é o root).
              // Como o container antecessor desse botão tem um decoration que define um backgroud color solido, o efeito não aparece pois é renderizado abaixo dele.
              // Para resolver isso, colocamos um outro widget material em cima do container e dentro dele o botão, assim o efeito é feito acima do decoration.
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoGroupEditPage(
                            todoGroupID: todoGroup.id,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1,
          child: Container(
            child: Center(
              child: todoGroup.todos.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: todoGroup.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoComponent(
                            todo: todoGroup.todos[index],
                            color: todoGroup.color,
                            onTap: () {
                              _markTodoStatus(
                                  todoID: todoGroup.todos[index].id);
                            });
                      },
                    )
                  : BackgroundMessage(
                      message: 'Tudo feito!',
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
