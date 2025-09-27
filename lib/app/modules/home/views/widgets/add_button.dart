import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_getx/app/modules/add_todo/views/screen/todo_add_screen.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.to(const TodoAddScreen()),
      child: Icon(Icons.add),
    );
  }
}
