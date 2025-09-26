import 'package:flutter/material.dart';
import 'package:todo_getx/app/modules/add_todo/views/widgets/todo_add_form.dart';
import 'package:todo_getx/app/widgets/custom_appbar.dart';

class TodoAddScreen extends StatelessWidget {
  const TodoAddScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TitleAppBar('Add New Todo'), body: TodoAddForm());
  }
}
