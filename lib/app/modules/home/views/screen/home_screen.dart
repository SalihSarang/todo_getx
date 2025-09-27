import 'package:flutter/material.dart';
import 'package:todo_getx/app/modules/home/views/widgets/add_button.dart';
import 'package:todo_getx/app/modules/home/views/widgets/home_screen_body.dart';
import 'package:todo_getx/app/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar('HomeScreen'),
      body: HomeScreenBody(),
      floatingActionButton: AddButton(),
    );
  }
}
