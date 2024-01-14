import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: const EdgeInsets.only(
            top: 100,
            left: 200,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 100,
          ),
          // alignment: const Alignment(1, -1),
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            // backgroundBlendMode: BlendMode.color,
            // shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                Colors.blue,
                Colors.pink,
                Color.fromRGBO(255, 222, 128, 1),
              ],
            ),
            color: Colors.amber,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(
              color: Colors.red,
              width: 10,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 10,
                offset: const Offset(10, 20),
              ),
            ],
          ),
          child: const Text(
            "Flutter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
