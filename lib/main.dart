import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  HomePage2({super.key});
  TextEditingController userName = TextEditingController();
  String userNameText = "";
  List<String> names = [
    'mhd',
    'maya',
    'obada',
    'hakam',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("FAB"),
        icon: const Icon(Icons.abc),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          // (context, index) {
          //   return Text(names[index]);
          // },
          // childCount: names.length,
          [
            Container(
              width: 200,
              color: Colors.red,
              child: const ListTile(
                title: Text("Hello"),
              ),
            ),
            const ListTile(
              title: Text("Hello"),
            ),
            const ListTile(
              title: Text("Hello"),
            ),
            TextField(
              style: const TextStyle(
                color: Colors.yellow,
              ),
              onChanged: (value) {
                // print(userName.text);
              },
              onSubmitted: (value) {
                print(userName.text);
              },
              controller: userName,
              decoration: const InputDecoration(
                // label: const Text("User Name"),
                icon: Icon(
                  Icons.person,
                ),
                hintText: "Please Enter Your User Name ...",
                hintStyle: TextStyle(
                  color: Colors.pink,
                ),
                labelText: "User Name",
                labelStyle: TextStyle(
                  color: Colors.deepPurple,
                ),
                iconColor: Colors.blue,
                // prefix: const Icon(
                //   Icons.person,
                //   color: Colors.black,
                // ),
                suffixIcon: Icon(Icons.favorite_outline),
                // prefixText: "User",
                // prefixStyle: TextStyle(
                //   color: Colors.amber,
                // ),
                // prefixIcon: Padding(
                //   padding: EdgeInsets.only(left: 20),
                //   child: Text(
                //     "user",
                //     style: TextStyle(color: Colors.teal),
                //   ),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 10,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  userNameText = userName.text;
                  print(userNameText);
                  userName.clear();
                },
                child: const Text("Click me!")),
            MaterialButton(
              height: 100,
              minWidth: 100,
              shape: const BeveledRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 10,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SecondScreen();
                }));
              },
              color: Colors.blue,
              child: const Text("Go To Secrond Screen"),
            )
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   List<String> names = ['Mhd', "Maya", "Hakm", "Amr", "Nour", "Yazan", "Adnan"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.custom(
//       itemCount: names.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text(index.toString()),
//           ),
//           title: Text(names[index]),
//         );
//       },
//       separatorBuilder: (context, i) {
//         return const Divider();
//       },
//       // scrollDirection: Axis.horizontal,
//       // reverse: true,
//       physics: const BouncingScrollPhysics(),
//       // children: const [
//       //   ListTile(
//       //     title: Text('Hello 123'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   ),
//       //   ListTile(
//       //     title: Text('Hello'),
//       //     subtitle: Text('World'),
//       //     leading: CircleAvatar(
//       //       child: FlutterLogo(),
//       //     ),
//       //   )
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       //   // FlutterLogo(
//       //   //   size: 50,
//       //   // ),
//       // ],
//     ));
//   }
// }
