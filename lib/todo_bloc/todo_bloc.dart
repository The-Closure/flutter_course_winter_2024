import 'package:firebase_test/service/firestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_test/model/todo_model.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FireStoreService fireStoreService;
  TodoBloc(this.fireStoreService) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is LoadTodo) {
        emit(TodoLoading());
        try {
          List<TodoModel> todos = await fireStoreService.getAllTodos().first;
          emit(TodoLoaded(todos: todos));
        } catch (e) {
          emit(
            TodoError(
              errorMessage: e.toString(),
            ),
          );
        }
      }
      if (event is AddTodo) {
        emit(TodoLoading());
        try {
          await fireStoreService.createTodo(event.newTodo);
          emit(TodoOperationDetails(
              opreationMessage: "Todo was added successfully"));
        } catch (e) {
          emit(TodoError(errorMessage: e.toString()));
        }
      }
      if (event is UpadteTodo) {
        emit(TodoLoading());
        try {
          await fireStoreService.updateTodo(event.upadtedTodo);
          emit(TodoOperationDetails(
              opreationMessage: "Todo was updated successfully"));
        } catch (e) {
          emit(TodoError(errorMessage: e.toString()));
        }
      }
      if (event is DeleteTodo) {
        emit(TodoLoading());
        try {
          await fireStoreService.deleteTodo(event.deletedTodoId);
          emit(TodoOperationDetails(
              opreationMessage: "Todo was deleted successfully"));
        } catch (e) {
          emit(TodoError(errorMessage: e.toString()));
        }
      }
    });
  }
}
