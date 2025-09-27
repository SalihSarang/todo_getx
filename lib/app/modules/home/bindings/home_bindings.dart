import 'package:get/get.dart';
import 'package:todo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_getx/services/api_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
