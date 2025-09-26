import 'package:flutter/material.dart';
import 'package:todo_getx/app/widgets/alert_box.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  const TodoCard({super.key, required this.todo});

  @override
  build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 80,
      child: Card(
        color: Colors.black87,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListTile(
              onTap: () {},
              title: Text(todo.title, style: TextStyle(color: Colors.white)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteTodoDialog(
                          todoName: todo.title,
                          onConfirm: () async {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
