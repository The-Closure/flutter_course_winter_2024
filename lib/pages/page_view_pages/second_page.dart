import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "2",
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
