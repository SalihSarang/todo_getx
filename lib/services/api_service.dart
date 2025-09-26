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

  Future<void> addTodo(TodoModel todo) async {
    final response = await http.post(baceUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()));

    if (response.statusCode == 201) {
      log.d('Post success');
    } else {
      log.e('Post Failed');
    }
  }
}
