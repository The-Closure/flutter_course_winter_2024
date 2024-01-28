import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/view/pages/layeout_pageview.dart';
import 'package:flutter_ui/view/pages/slider_page.dart';

void main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: GridViewExample());
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 20,
                mainAxisExtent: 300,
                // mainAxisSpacing: 20
              ),
              children: [
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                ),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
