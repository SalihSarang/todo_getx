import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:todo_getx/models/todo_model.dart';

class ApiService {
  var log = Logger();
  final baceUrl =
      Uri.parse('https://6824452165ba058033998bef.mockapi.io/todos');

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(baceUrl);

    if (response.statusCode == 200) {
      log.d('Fetch todos success');
      List<dynamic> body = jsonDecode(response.body);
      List<TodoModel> data = body.map((e) => TodoModel.fromJson(e)).toList();
      return data;
    } else {
      log.e('Failed to load todos');
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoModel> fetchTodoDetails(String id) async {
    final response = await http.get(Uri.parse('$baceUrl/$id'));

    if (response.statusCode == 200) {
      log.d('Todo details fetched');
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      log.e('Failed to fetch details');
      throw Exception('Failed to fetch details');
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    final response = await http.post(baceUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()));

    if (response.statusCode == 201) {
      log.d('Post success');
    } else {
      log.e('Post Failed');
      throw Exception("Failed to post");
    }
  }

  Future<TodoModel> updateTodo(String id, TodoModel todo) async {
    final response = await http.put(Uri.parse('$baceUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(todo.toJson()));

    if (response.statusCode == 200) {
      log.d("Todo Updated");
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      log.e("Failed to update");
      throw Exception('Failed to update');
    }
  }

  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baceUrl/$id'));

    if (response.statusCode == 200) {
      log.d('Successfully deleted');
    } else {
      log.e("Failed to delete");
      throw Exception('Failed to delete');
    }
  }
}
