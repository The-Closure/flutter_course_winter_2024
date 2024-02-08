import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Row(
        children: [
          const AppDrawer(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
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
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.pink,
              )),
        ],
      ),
    );
  }
}
