import 'package:flutter/material.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_getx/app/widgets/text_field.dart';

class TodoAddForm extends StatelessWidget {
  const TodoAddForm({super.key, required this.formKey, required this.ctrl});
  final GlobalKey<FormState> formKey;
  final TodoController ctrl;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Tilte',
              hint: 'Title',
              controller: ctrl.titleController,
              validator: (v) => ctrl.validateTitle(v),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Details',
              hint: 'Details',
              controller: ctrl.detailsController,
              validator: (v) => ctrl.validateDetails(v),
            )
          ],
        ));
  }
}
