import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Map",
                  icon: Icon(Icons.map),
                ),
                Tab(
                  text: "Music",
                  icon: Icon(Icons.music_note),
                ),
                Tab(
                  text: "Videos",
                  icon: Icon(Icons.video_call),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          )),
    );
  }
}
