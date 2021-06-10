import 'package:flutter/material.dart';
import 'package:todo_flutter/components/backgroundMessage.dart';
import 'package:todo_flutter/components/todoComponent.dart';
import 'package:todo_flutter/pages/todoGroupEditPage.dart';
import 'package:todo_flutter/api/dtos/TodoGroupDTO.dart';

class TodoGroupComponent extends StatefulWidget {
  final int index;
  final TodoGroupDTO todoGroup;
  final bool isLast;
  final void Function({required String todoGroupID, required String todoID})
      onTodoClick;
  final Function onEditReturn;

  const TodoGroupComponent(
      {Key? key,
      required this.index,
      required this.todoGroup,
      required this.isLast,
      required this.onTodoClick,
      required this.onEditReturn})
      : super(key: key);

  @override
  _TodoGroupComponentState createState() => _TodoGroupComponentState();
}

class _TodoGroupComponentState extends State<TodoGroupComponent>
    with TickerProviderStateMixin {
  bool isOpen = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
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
                      widget.todoGroup.title,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Color(widget.todoGroup.color),
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
                            todoGroupID: widget.todoGroup.id,
                          ),
                        ),
                      ).then((value) {
                        widget.onEditReturn();
                      });
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
              child: widget.todoGroup.todos.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.todoGroup.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoComponent(
                            todo: widget.todoGroup.todos[index],
                            color: widget.todoGroup.color,
                            onTap: () {
                              widget.onTodoClick(
                                  todoGroupID: widget.todoGroup.id,
                                  todoID: widget.todoGroup.todos[index].id);
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
