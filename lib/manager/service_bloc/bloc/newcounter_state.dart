// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'newcounter_bloc.dart';

@immutable
sealed class NewcounterState {}

final class NewcounterInitial extends NewcounterState {}

class SuccessToAdd extends NewcounterState {
  int counter;
  SuccessToAdd({
    required this.counter,
  });
}
