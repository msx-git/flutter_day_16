import 'package:flutter_day_16/pages/task_1/models/todo_model.dart';

class TodoRepository {
  final todos = [
    Todo(id: 0, title: "Finish the project"),
    Todo(id: 1, title: "Buy groceries"),
    Todo(id: 3, title: "Call mom"),
  ];

  void finishTodo(int id) {
    for (var todo in todos) {
      if (todo.id == id) {
        todo.isDone = !todo.isDone;
      }
    }
  }
}
