import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_getx/app/modules/home/views/widgets/center_text.dart';
import 'package:todo_getx/app/modules/home/views/widgets/list_view_builder.dart';
import 'package:todo_getx/app/modules/home/views/widgets/loading_state.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});
  final HomeController ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (ctrl.isLoading.value) LoadingState();

        if (ctrl.error.isNotEmpty) CenterText(message: ctrl.error.value);

        if (ctrl.data.isEmpty) CenterText(message: 'No todo added yet');

        return TodoList(ctrl.data);
      },
    );
  }
}
