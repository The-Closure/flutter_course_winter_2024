part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded({required this.todos});
}

class TodoOperationDetails extends TodoState {
  final String opreationMessage;

  TodoOperationDetails({required this.opreationMessage});
}

class TodoError extends TodoState {
  final String errorMessage;

  TodoError({required this.errorMessage});
}
