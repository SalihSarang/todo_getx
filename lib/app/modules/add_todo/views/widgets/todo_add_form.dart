import 'package:flutter/material.dart';

class TodoAddForm extends StatelessWidget {
  TodoAddForm({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [],
        ));
  }
}
