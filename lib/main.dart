import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: FlutterLogo(),
          title: Text('Hello World'),
          actions: [FlutterLogo(), FlutterLogo(), FlutterLogo()],
        ),
        body: Container(
          width: double.maxFinite,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ), Container(
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
               Container(
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.black,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              // Container(
              //   width: 300,
              //   height: 300,
              //   color: Colors.green,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
