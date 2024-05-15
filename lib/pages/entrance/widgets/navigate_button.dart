import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton(
      {super.key, required this.title, required this.navigateTo});

  final String title;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => navigateTo),
        ),
        child: Ink(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                const Icon(Icons.arrow_forward_ios_rounded, size: 18)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
