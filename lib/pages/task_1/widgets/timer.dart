import 'package:flutter/material.dart';

class TimerTask extends StatelessWidget {
  const TimerTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
        leading: const SizedBox(),
        centerTitle: true,
      ),
    );
  }
}
