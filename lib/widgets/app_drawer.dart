import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: const Column(
        children: [
          DrawerHeader(
            child: FlutterLogo(),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Home"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Settings"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Chat"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
