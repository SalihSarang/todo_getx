import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/api_service.dart';

class TodoController extends GetxController {
  final ApiService api = Get.put(ApiService());

  final RxList<TodoModel> data = <TodoModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

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

  Future<void> addTodo(TodoModel todo) async {
    try {
      isLoading.value = true;
      await api.addTodo(todo);
      await getTodos();
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'e.toString', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTodoStatus(TodoModel todo, bool isCompleted) async {
    try {
      final updatedTodo = await api.updateTodo(
          todo.id, todo.copyWith(isCompleted: isCompleted));
      int index = data.indexWhere(
        (t) => t.id == todo.id,
      );
      if (index != -1) {
        data[index] = updatedTodo;
      }
    } catch (e) {
      Get.snackbar('Error', "Failed to update todo status");
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      isLoading.value = true;
      await api.deleteTodo(id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      await getTodos();
    }
  }

  String? validateTitle(String? value) {
    if (value!.trim().isEmpty) return "Title cannot be empty";
    if (value.length < 3) return "Title too short";
    return null;
  }

  String? validateDetails(String? value) {
    if (value!.trim().isEmpty) return "Details cannot be empty";
    return null;
  }
}
