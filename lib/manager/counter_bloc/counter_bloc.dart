import 'package:bloc_state_management/manager/counter_bloc/counter_event.dart';
import 'package:bloc_state_management/manager/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounter extends Bloc<CounterEvent, CounterState> {
  BlocCounter() : super(InitState()) {
    int counter = 0;

    on<IncreamentCounter>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1));
      counter = counter + 1;
      emit(CounterHasBeenIncreamenSuccess(counter: counter));
    });
  }
}
