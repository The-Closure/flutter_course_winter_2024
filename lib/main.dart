import 'package:firebase_test/config/service_locator.dart';
import 'package:firebase_test/service/firestore_service.dart';
import 'package:firebase_test/todo_bloc/todo_bloc.dart';
import 'package:firebase_test/views/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServiceLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        ServiceLocator().getI.get<FireStoreService>(),
      )..add(LoadTodo()),
      child: Builder(builder: (context) {
        return MaterialApp(
          home: TodoView(),
        );
      }),
    );
  }
}
