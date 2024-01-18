import 'package:flutter/material.dart';
import 'package:sized_box_etc/pages/page_view_pages/core_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ! Please Put CorePage() or HomePage() in home: property To see the whole Lecture Component
      home: CorePage(),
    );
  }
}
