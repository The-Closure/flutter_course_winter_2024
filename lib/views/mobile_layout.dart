import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey.shade200,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey.shade400,
                  child: const ListTile(
                    title: Text("List Tile Item"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
