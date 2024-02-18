import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newcounter_event.dart';
part 'newcounter_state.dart';

class NewcounterBloc extends Bloc<NewcounterEvent, NewcounterState> {
  NewcounterBloc() : super(NewcounterInitial()) {
    int counter = 0;
    on<AddNumber>((event, emit) {
      counter = counter + 1;
      emit(SuccessToAdd(counter: counter));
    });

    on<ChangedNumber>((event, emit) {
      counter = event.newValue;
      emit(SuccessToAdd(counter: counter));
    });
  }
}
