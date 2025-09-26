import 'package:get/get.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService api = Get.put(ApiService());
  final RxList<TodoModel> data = <TodoModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      isLoading.value = true;
      error.value = '';
      data.value = await api.fetchTodos();
    } catch (e) {
      error.value = e.toString();
      Get.snackbar('Error', error.value, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
