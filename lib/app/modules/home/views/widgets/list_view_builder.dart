import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:todo_getx/app/modules/home/views/widgets/todo_card.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoList extends StatelessWidget {
  final RxList<TodoModel> todos;
  const TodoList(this.todos, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoCard(todo: todo);
      },
    );
  }
}
