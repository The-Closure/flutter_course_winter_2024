import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Second Screen"),
        leading: Container(),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Second Page",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Go To Home Page")),
          ],
        ),
      ),
    );
  }
}
