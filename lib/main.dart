import 'package:flutter/cupertino.dart';
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

List<String> names = ["Ahmad", "Yaser", "Noor", "Omar"];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      floatingActionButton: FloatingActionButton(onPressed: () {
        key.currentState!.openDrawer();
      }),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  accountName: Text("abdalaziztll992010@gmail.com"),
                  accountEmail: FlutterLogo()),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Container(),
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 40, color: Colors.red),
            text: 'H',
            children: [
              TextSpan(text: 'E'),
              TextSpan(style: TextStyle(color: Colors.amber), text: 'L'),
              TextSpan(style: TextStyle(color: Colors.amber), text: 'L'),
              TextSpan(
                text: 'O',
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownMenu<String>(
            label: Text("Please choose one item"),
            
              dropdownMenuEntries: List.generate(names.length, (index) {
            return DropdownMenuEntry(value: names[index], label: names[index]);
          })),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                names[0] = value;
              });
            },
            child: Text(names[0]),
            initialValue: names[0],
            itemBuilder: (context) => [
              PopupMenuItem(child: Text(names[1]), value: names[1]),
              PopupMenuItem(
                child: Text(names[2]),
                value: names[2],
              ),
              PopupMenuItem(
                child: Text(names[3]),
                value: names[3],
              )
            ],
          ),
          Center(
              child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showMaterialBanner(
                  new MaterialBanner(
                      elevation: 20,
                      backgroundColor: Colors.red,
                      content: Text("Title"),
                      actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.abc))
                  ]));

              // showAdaptiveDialog(
              //   barrierDismissible: false,
              //   context: context,
              //   builder: (context) => AlertDialog.adaptive(
              //     title: Text("NOTE !!"),
              //     content: Text("Are you sure want to Delete ?"),
              //     actions: [
              //       CupertinoDialogAction(
              //         child: Text("Yes"),
              //       ),
              //       CupertinoDialogAction(
              //         child: Text("No"),
              //       )
              //     ],
              //   ),
              // );
            },
            child: Container(
              child: Tooltip(
                  richMessage: WidgetSpan(
                      child: Container(
                    child: Text('...'),
                    color: Colors.teal,
                    width: 30,
                    height: 30,
                  )),
                  child: FlutterLogo()),
            ),
          )),
        ],
      ),
    );
  }
}
