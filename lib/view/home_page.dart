import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_provider_theme/config/di.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // SharedPreferences db = await SharedPreferences.getInstance();
                // db.setString('name', 'hakam');
                // print("data was added");
                getIt.get<SharedPreferences>().setString('name', 'obada');
                print("Data Added");
              },
              child: const Text("Set Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                // SharedPreferences db = await SharedPreferences.getInstance();
                // print(db.getString('name'));
                print(getIt.get<SharedPreferences>().getString('name'));
              },
              child: const Text("print data"),
            ),
          ],
        ),
      ),
    );
  }
}
