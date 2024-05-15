import 'package:flutter/material.dart';
import 'package:flutter_day_16/pages/task_1/repositories/todo_repository.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todoRepository = TodoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoRepository.todos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: todoRepository.todos[index].isDone,
                    onChanged: (val) {
                      setState(() {
                        todoRepository
                            .finishTodo(todoRepository.todos[index].id);
                      });
                    },
                  ),
                  Text(
                    todoRepository.todos[index].title,
                    style: TextStyle(
                      fontSize: 20,
                      decoration: todoRepository.todos[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
