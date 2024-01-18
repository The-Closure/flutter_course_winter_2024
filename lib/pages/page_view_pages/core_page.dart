import 'package:flutter/material.dart';
import 'package:sized_box_etc/pages/page_view_pages/first_page.dart';
import 'package:sized_box_etc/pages/page_view_pages/second_page.dart';
import 'package:sized_box_etc/pages/page_view_pages/third_page.dart';

class CorePage extends StatelessWidget {
  CorePage({super.key});
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollBehavior: const MaterialScrollBehavior(),
        scrollDirection: Axis.vertical,
        children: [
          FirstPage(
            pageController: pageController,
          ),
          const SecondPage(),
          const ThirdPage(),
        ],
      ),
    );
  }
}
