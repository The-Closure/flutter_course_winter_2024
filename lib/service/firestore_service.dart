import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/model/todo_model.dart';

class FireStoreService {
  CollectionReference<Map<String, dynamic>> firebaseFirestore =
      FirebaseFirestore.instance.collection('todos');
  Stream<List<TodoModel>> getAllTodos() {
    return firebaseFirestore.snapshots().map((snapshot) {
      return List.generate(snapshot.size, (index) {
        TodoModel data = TodoModel.fromMap(snapshot.docs[index].data());
        return TodoModel(
          title: data.title,
          id: snapshot.docs[index].id,
          completed: data.completed,
        );
      });
    });
  }

  updateTodo(TodoModel todo) async {
    await firebaseFirestore.doc(todo.id).update(todo.toMap());
  }

  createTodo(TodoModel todo) async {
    await firebaseFirestore.doc().set(todo.toMap());
  }

  deleteTodo(String todoId) async {
    await firebaseFirestore.doc(todoId).delete();
  }
}
