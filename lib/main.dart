import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/chat_page.dart';
import 'package:flutter_application_4/pages/home_page.dart';
import 'package:flutter_application_4/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CorePage(),
    );
  }
}

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  List<Widget> pages = [
    const HomePage(),
    const SettingsPage(),
    const ChatPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentIndex,
        onDestinationSelected: (newDEstination) {
          setState(() {
            currentIndex = newDEstination;
            print(newDEstination);
          });
        },
        destinations: const [
          NavigationDestination(
            // enabled: false,
            tooltip: "Home",
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
