import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

late double width;
late double height;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width / 2,
          child: TextField(
            onChanged: (ca) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ));
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width / 3,
              height: height / 4,
              color: Colors.red,
            ),
            SizedBox(
              child: Container(
                color: Colors.blue,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hello",
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ),
              width: width / 2,
              height: 100,
            ),
            Align(
              child: FlutterLogo(),
            ),
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: Container(
            //     color: Colors.yellow,
            //   ),
            // ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20),
                itemBuilder: (context, index) => CircleAvatar(),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.teal,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
