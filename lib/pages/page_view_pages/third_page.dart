import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          "3",
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
