// ignore_for_file: public_member_api_docs, sort_constructors_first


abstract class CounterState {}


class InitState extends CounterState {}


class CounterHasBeenIncreamenSuccess extends CounterState {
int counter;
  CounterHasBeenIncreamenSuccess({
    required this.counter,
  });
}

class LoadingState extends CounterState {}
