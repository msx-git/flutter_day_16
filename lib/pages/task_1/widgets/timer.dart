import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_day_16/utils/extensions.dart';

class TimerTask extends StatefulWidget {
  const TimerTask({super.key});

  @override
  State<TimerTask> createState() => _TimerTaskState();
}

class _TimerTaskState extends State<TimerTask> {
  int initialSeconds = 30;
  int remainingSeconds = 0;
  bool isStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Text(
              '$remainingSeconds',
              style: const TextStyle(fontSize: 50),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (initialSeconds > 0) initialSeconds--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$initialSeconds second${initialSeconds > 1 ? 's' : ''}',
                  style: const TextStyle(fontSize: 30),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      initialSeconds++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: !isStarted
                ? () {
                    setState(() {
                      isStarted = true;
                      remainingSeconds = initialSeconds;
                    });

                    Timer.periodic(
                      const Duration(seconds: 1),
                      (timer) {
                        setState(
                          () {
                            if (remainingSeconds > 0) {
                              remainingSeconds--;
                            } else {
                              timer.cancel();
                              isStarted = false;
                            }
                          },
                        );
                      },
                    );
                  }
                : null,
            child: const Text('START'),
          ),
          20.height,
        ],
      ),
    );
  }
}
