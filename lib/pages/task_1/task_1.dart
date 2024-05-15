import 'package:flutter/material.dart';
import 'package:flutter_day_16/pages/task_1/widgets/temperature.dart';
import 'package:flutter_day_16/pages/task_1/widgets/timer.dart';
import 'package:flutter_day_16/pages/task_1/widgets/todo_list.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Temperature(),
          TodoList(),
          TimerTask(),
        ],
      ),
    );
  }
}
