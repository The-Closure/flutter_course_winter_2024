// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class LoadTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel newTodo;
  AddTodo({
    required this.newTodo,
  });
}

class UpadteTodo extends TodoEvent {
  final TodoModel upadtedTodo;

  UpadteTodo({required this.upadtedTodo});
}

class DeleteTodo extends TodoEvent {
  final String deletedTodoId;

  DeleteTodo({required this.deletedTodoId});
}
