import 'package:firebase_test/model/todo_model.dart';
import 'package:firebase_test/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TodoView extends StatelessWidget {
  TodoView({super.key});
  TextEditingController taskTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireStore App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Task Title"),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: taskTitle,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: Colors.purple,
                      onPressed: () {
                        context.read<TodoBloc>().add(
                              AddTodo(
                                newTodo: TodoModel(
                                  title: taskTitle.text,
                                  completed: false,
                                  id: DateTime.now().toString(),
                                ),
                              ),
                            );
                        taskTitle.clear();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "add",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoOperationDetails) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.opreationMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.todos[index].title),
                    leading: Checkbox(
                      value: state.todos[index].completed,
                      onChanged: (value) {
                        context.read<TodoBloc>().add(
                              UpadteTodo(
                                upadtedTodo: state.todos[index].copyWith(
                                  completed: value,
                                  id: state.todos[index].id,
                                ),
                              ),
                            );
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(
                              DeleteTodo(deletedTodoId: state.todos[index].id),
                            );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          } else if (state is TodoOperationDetails) {
            context.read<TodoBloc>().add(LoadTodo());
            return Container();
          } else if (state is TodoError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
