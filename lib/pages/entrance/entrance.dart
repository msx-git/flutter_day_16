import 'package:flutter/material.dart';
import 'package:flutter_day_16/pages/entrance/widgets/navigate_button.dart';
import 'package:flutter_day_16/pages/task_1/task_1.dart';
import 'package:flutter_day_16/pages/task_2/task_2.dart';
import 'package:flutter_day_16/utils/extensions.dart';

class Entrance extends StatelessWidget {
  const Entrance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NavigateButton(title: '1. Kichik topshiriqlar', navigateTo: Task1()),
          20.height,
          const NavigateButton(title: '2. Asosiy vazifa', navigateTo: Task2()),
          20.height,
        ],
      ),
    );
  }
}
