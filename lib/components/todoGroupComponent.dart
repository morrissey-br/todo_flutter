import 'package:flutter/material.dart';
import 'package:todo_flutter/components/allDoneComponent.dart';
import 'package:todo_flutter/components/todoComponent.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class TodoGroupComponent extends StatefulWidget {
  final int index;
  final TodoGroup todoGroup;
  final bool isLast;

  const TodoGroupComponent({Key key, this.index, this.todoGroup, this.isLast})
      : super(key: key);

  @override
  _TodoGroupComponentState createState() => _TodoGroupComponentState();
}

class _TodoGroupComponentState extends State<TodoGroupComponent>
    with TickerProviderStateMixin {
  bool isOpen = false;

  AnimationController _controller;
  Animation<double> _animation;

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
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      widget.todoGroup.title,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Color(widget.todoGroup.color),
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
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
                        );
                      },
                    )
                  : AllDone(),
            ),
          ),
        ),
      ],
    );
  }
}
