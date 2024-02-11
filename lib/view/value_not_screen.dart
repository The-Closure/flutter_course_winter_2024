
import 'package:flutter/material.dart';

class FlurreDemo extends StatelessWidget {
  FlurreDemo({super.key});

  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "you pushed this button",
              style: TextStyle(fontSize: 24),
            ),
            ValueListenableBuilder(
              child: FlutterLogo(),
              valueListenable: counter,
              builder: (context, value, child) {
                if (value > 2) {
                  return Text(value.toString());
                } else {
                  return child!;
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value = counter.value + 1;
          print(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}