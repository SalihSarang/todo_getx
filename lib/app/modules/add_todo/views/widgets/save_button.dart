import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TodoController ctrl;
  const SaveButton({super.key, required this.formKey, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Obx(
        () {
          if (ctrl.isLoading.value) return CircularProgressIndicator();
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final todo = TodoModel(
                  id: DateTime.now().toString(),
                  title: ctrl.titleController.text,
                  details: ctrl.detailsController.text,
                  isCompleted: false,
                );
                ctrl.addTodo(todo);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, foregroundColor: Colors.white),
            child: const Text('Save'),
          );
        },
      ),
    );
  }
}
