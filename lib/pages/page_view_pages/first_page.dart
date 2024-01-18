import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "1",
              style: TextStyle(
                fontSize: 100,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // pageController.animateToPage(
                //   2,
                //   duration: const Duration(seconds: 3),
                //   curve: Curves.bounceInOut,
                // );
                pageController.nextPage(
                    duration: const Duration(seconds: 3),
                    curve: Curves.bounceOut);
              },
              child: const Text("Go to Page 3"),
            ),
          ],
        ),
      ),
    );
  }
}
