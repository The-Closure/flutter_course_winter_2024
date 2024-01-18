import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action button");
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
          size: 30,
          // semanticLabel: "Like",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Hello Flutter",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Image.network(
              "https://i.imgur.com/1CZsTmV.png",
              fit: BoxFit.fill,
            ),
          ),
          Image.asset('assets/images/image1.jpeg'),
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: Text("Padding"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: const BeveledRectangleBorder(),
            ),
            onPressed: () {
              print("Elevated Button");
            },
            child: const Text("Elevated Button"),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text("OutLine Button"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Text Button"),
          ),
        ],
      ),
    );
  }
}
