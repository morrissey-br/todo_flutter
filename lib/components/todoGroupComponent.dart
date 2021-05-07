import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoComponent.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class TodoGroupComponent extends StatefulWidget {
  final TodoGroup todoGroup;

  const TodoGroupComponent({Key key, this.todoGroup}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoGroupComponent>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool isOpen = false;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openClose() {
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
        GestureDetector(
          onTap: _openClose,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.grey.shade300,
                  offset: Offset(0, -1),
                )
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        widget.todoGroup.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Color(widget.todoGroup.color)),
                      ),
                    ),
                  ],
                ),
                SizeTransition(
                  sizeFactor: _animation,
                  axisAlignment: -1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.todoGroup.todos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TodoComponent(
                                todo: widget.todoGroup.todos[index],
                                color: widget.todoGroup.color,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
