// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'newcounter_bloc.dart';

@immutable
sealed class NewcounterEvent {}

class AddNumber extends NewcounterEvent {}

class ChangedNumber extends NewcounterEvent {
  int newValue;
  ChangedNumber({
    required this.newValue,
  });
}
