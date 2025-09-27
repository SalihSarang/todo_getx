import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/modules/add_todo/views/widgets/save_button.dart';
import 'package:todo_getx/app/modules/add_todo/views/widgets/todo_add_form.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';

class TodoAddBody extends StatelessWidget {
  const TodoAddBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ctrl = Get.find<TodoController>();

    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Column(
        children: [
          TodoAddForm(
            formKey: formKey,
            ctrl: ctrl,
          ),
          SaveButton(
            formKey: formKey,
            ctrl: ctrl,
          )
        ],
      ),
    );
  }
}
