
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Transform.rotate(
                // angle: double.parse(snapshot.data.toString()),
                angle: -pi / double.parse((snapshot.data).toString()),
                child: Container(
                  width: 30,
                  height: 400,
                  color: Colors.red,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Stream<num> getStream() async* {
  for (var i = 1; i < 1000; i++) {
    await Future.delayed(Duration(seconds: 1), () {});
    yield i;
  }
}