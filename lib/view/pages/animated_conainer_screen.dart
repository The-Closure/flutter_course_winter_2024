
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 200;
  double height = 200;
  bool isVisible = true;
  Color color = Colors.red;
  Color color1 = Colors.red;
  Color color2 = Colors.red;
  Color color3 = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isVisible = true;
                  width = width - 50;
                  height = height - 50;
                  color = Colors.red;
                  print("${width} ----- ${height}");
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                color: color,
                width: width,
                height: height,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isVisible = true;
                  width = 200;
                  height = 200;
                  color = Colors.red;
                  print("${width} ----- ${height}");
                });
              },
              child: FlutterLogo(
                duration: Duration(seconds: 3),
                size: width,
              ),
            ),
            Visibility(
              visible: isVisible,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible = false;
                      width = width + 50;
                      height = height + 50;
                      color = Colors.blue;
                      print("${width} ----- ${height}");
                    });
                  },
                  child: Text("press me")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        color1 = Colors.black;
                        color2 = Colors.red;
                        color3 = Colors.red;
                      });
                    },
                    child: CircleAvatar(backgroundColor: color1)),
                InkWell(
                    onTap: () {
                      setState(() {
                        color2 = Colors.black;
                        color1 = Colors.red;
                        color3 = Colors.red;
                      });
                    },
                    child: CircleAvatar(backgroundColor: color2)),
                InkWell(
                    onTap: () {
                      setState(() {
                        color3 = Colors.black;
                        color2 = Colors.red;
                        color1 = Colors.red;
                      });
                    },
                    child: CircleAvatar(backgroundColor: color3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
