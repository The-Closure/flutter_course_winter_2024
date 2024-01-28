
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/pages/slider_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SliderPage()
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Plan And Go",
          style: TextStyle(
              fontSize: 32, color: Colors.black26, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
