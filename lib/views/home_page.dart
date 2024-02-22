import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore db = FirebaseFirestore.instance;
//                   DatabaseReference ref =
//                       FirebaseDatabase.instance.ref("users/123");

                  // await ref.set({
                  //   "name": "Iphone 8",
                  //   "Srial Number": 1832131561651,
                  // });

// Only update the name, leave the age and address!
//                   await ref.update({
//                     "age": 50,
//                   });
                  final city = <String, dynamic>{
                    "name": "Los Angeles",
                    "state": "CA",
                    "country": "USA"
                  };

                  await db.collection("cities").doc("LA").set(city);
                },
                child: const Text("Save your data")),
            ElevatedButton(
              onPressed: () {
                DatabaseReference ref =
                    FirebaseDatabase.instance.ref("users/123");
                ref.onValue.listen((DatabaseEvent event) {
                  final data = event.snapshot.value;
                  print(data);
                });
              },
              child: const Text("print data"),
            ),
          ],
        ),
      ),
    );
  }
}
