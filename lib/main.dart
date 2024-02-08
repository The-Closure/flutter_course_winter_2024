import 'package:flutter/material.dart';
import 'package:respponsive_ui/adaptive_layout.dart';

import 'adaptive_layout/desktop_layout.dart';
import 'adaptive_layout/mobile_layout.dart';
import 'adaptive_layout/tablet_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return const Scaffold(
      // body: Center(
      //   child: Container(
      //     color: Colors.red,
      //     width: screenWidth / 2,
      //     height: screenHeight / 5,
      //   ),
      // ),
      body: AdaptiveLayout(
          mobileLayout: MobileLayout(),
          tabletLayout: TabletLayout(),
          desktopLayout: DesktopLayout()),
    );
  }
}
