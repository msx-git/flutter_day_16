import 'package:flutter/material.dart';
import 'package:flutter_day_16/utils/extensions.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  bool isCelsius = true;
  double temp = 0;

  final TextEditingController tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AbsorbPointer(
                absorbing: isCelsius,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor:
                          isCelsius ? Colors.deepPurple : Colors.white),
                  onPressed: () {
                    setState(() {
                      isCelsius = true;
                      isCelsius
                          ? temp = double.parse(tempController.text) * 1.8 + 32
                          : temp =
                              (double.parse(tempController.text) - 32) / 1.8;
                    });
                  },
                  child: Text(
                    'Celsius to Fahrenheit',
                    style: TextStyle(
                        color: isCelsius ? Colors.white : Colors.deepPurple),
                  ),
                ),
              ),
              AbsorbPointer(
                absorbing: !isCelsius,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor:
                          !isCelsius ? Colors.deepPurple : Colors.white),
                  onPressed: () {
                    setState(() {
                      isCelsius = false;
                      isCelsius
                          ? temp = double.parse(tempController.text) * 1.8 + 32
                          : temp =
                              (double.parse(tempController.text) - 32) / 1.8;
                    });
                  },
                  child: Text(
                    'Fahrenheit to Celsius',
                    style: TextStyle(
                        color: !isCelsius ? Colors.white : Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: temp != 0 && tempController.text.isNotEmpty ? 1 : 0,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  20.width,
                  Text(
                    isCelsius
                        ? "${tempController.text}\u2103"
                        : "${tempController.text}\u2109",
                    style: const TextStyle(fontSize: 50),
                  ),
                  const Text(
                    '=',
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    !isCelsius ? "$temp\u2103" : "$temp\u2109",
                    style: const TextStyle(fontSize: 50),
                  ),
                  20.width,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: tempController,
              decoration: const InputDecoration(
                labelText: 'Enter temperature here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onSubmitted: (val) {
                setState(() {
                  isCelsius
                      ? temp = double.parse(val) * 1.8 + 32
                      : temp = (double.parse(val) - 32) / 1.8;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
