import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView(
        children: [
          Scaffold(
            body: Column(
              children: [
                Image.asset('images/logo/logo.png'),
                Text(
                    'Mollit non commodo ex irure sint nisi magna nisi pariatur fugiat elit exercitation esse adipisicing. Mollit Lorem Lorem id non veniam ea cupidatat do laborum aliquip exercitation aliquip. Non veniam qui ullamco dolor sint sunt velit sint. Nisi cillum aliqua sint nulla id et reprehenderit sint elit. Nisi esse pariatur do irure id culpa mollit consequat.')
              ],
            ),
          ),
          Scaffold(
            body: Column(
              children: [
                Image.asset('images/logo/meta_logo.png'),
                Text('Veniam cillum eu nostrud aliquip.')
              ],
            ),
          )
        ],
      )),
    );
  }
}
