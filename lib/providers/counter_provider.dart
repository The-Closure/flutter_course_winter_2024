import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  void clear() {
    counter = 0;
    notifyListeners();
  }
}
