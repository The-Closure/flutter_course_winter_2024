import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/comment_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, response) {
        if (response.hasData) {
          dynamic temp = response.data;
          // List<CommentModel> comments = [];
          // for (var element in temp) {
          //   CommentModel comment = CommentModel(
          //       postId: element['postId'],
          //       id: element['id'],
          //       name: element['name'],
          //       email: element['email'],
          //       body: element['body']);
          //   comments.add(comment);
          // }
          List<CommentModel> comments = List.generate(
              temp.length,
              (index) => CommentModel(
                  postId: temp[index]['postId'],
                  id: temp[index]['id'],
                  name: temp[index]['name'],
                  email: temp[index]['email'],
                  body: temp[index]['body']));
          return Center(
              child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                trailing: Image.network(
                  "https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png",

                  // errorBuilder: (context, error, stackTrace) {
                  //   return FlutterLogo();
                  // },
                ),
                title: Text(comments[index].name),
                subtitle: Text(comments[index].email),
                leading: CircleAvatar(
                  child: Text(comments[index].id.toString()),
                ),
              ),
            ),
          ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

getData() async {
  Dio dio = Dio();
  Response response =
      await dio.get("https://jsonplaceholder.typicode.com/comments");
  return response.data;
}
