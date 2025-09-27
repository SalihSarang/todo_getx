import 'package:flutter/material.dart';
import 'package:todo_getx/app/widgets/custom_appbar.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar('Todo Details'),
    );
  }
}
