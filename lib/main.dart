import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:service_layer_clean/model/animal_model.dart';
import 'package:service_layer_clean/model/result_model.dart';
import 'package:service_layer_clean/service/animal_service.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.purple[300]),
        home: SericeLayerUi());
  }
}

class SericeLayerUi extends StatelessWidget {
  SericeLayerUi({super.key});

  TextEditingController name = TextEditingController();

  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Data ',
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: color,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Data ',
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool status = await AnimalServiceImp().createAnimal(
                      AnimalModel(name: name.text, color: color.text));
                  if (status) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalUIScreen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text("No intrenter"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text("send Data"))
          ],
        ),
      ),
    );
  }
}

class AnimalUIScreen extends StatelessWidget {
  AnimalUIScreen({super.key});

  ValueNotifier<List<AnimalModel>> animal =
      ValueNotifier([AnimalModel(name: "", color: "")]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () async {
              List<ResultModel> status = await AnimalServiceImp().getAnimals();
              if (status is List<AnimalModel>) {
                animal.value = status;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  content: Text("No intrenter"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: Text("get Data")),
      ),
      body: ValueListenableBuilder(
        valueListenable: animal,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(value[index].name),
              subtitle: Text(value[index].color),
            ),
          );
        },
      ),
    );
  }
}
