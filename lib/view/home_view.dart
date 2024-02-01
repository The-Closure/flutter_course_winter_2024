import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheckedForCheckBox = false;
  bool isSwitched = false;
  bool isCheckedForListTile = true;
  double loadingValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            activeColor: Colors.amber,
            activeThumbImage: const NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3CQDEO83utmrNSsVt4QtJrmGqM2Dg0gej5g&usqp=CAU"),
            // thumbColor: MaterialStateProperty.all(Colors.red),
            inactiveThumbColor: Colors.red,
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const DetailsItemPage();
                },
              ));
            },
            child: Hero(
              tag: 'detailsView',
              child: Card(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3CQDEO83utmrNSsVt4QtJrmGqM2Dg0gej5g&usqp=CAU"),
              ),
            ),
          ),
          Visibility(
            visible: isCheckedForListTile,
            replacement: InkWell(
              onTap: () {},
              onLongPress: () {
                setState(
                  () {
                    isCheckedForListTile = !isCheckedForListTile;
                  },
                );
              },
              child: const ListTile(
                title: Text("Check Box List Tile"),
              ),
            ),
            child: CheckboxListTile(
                secondary: const Icon(Icons.add),
                controlAffinity: ListTileControlAffinity.platform,
                title: const Text("Check Box List Tile"),
                subtitle: const Text("Subtitle For Checked Box List Tile"),
                value: isCheckedForListTile,
                onChanged: (value) {
                  setState(() {
                    isCheckedForListTile = value!;
                  });
                }),
          ),
          CheckboxListTile(
              secondary: const Icon(Icons.add),
              controlAffinity: ListTileControlAffinity.platform,
              title: const Text("Check Box List Tile"),
              subtitle: const Text("Subtitle For Checked Box List Tile"),
              value: isCheckedForListTile,
              onChanged: (value) {
                setState(() {
                  isCheckedForListTile = value!;
                });
              }),
          CheckboxListTile(
              secondary: const Icon(Icons.add),
              controlAffinity: ListTileControlAffinity.platform,
              title: const Text("Check Box List Tile"),
              subtitle: const Text("Subtitle For Checked Box List Tile"),
              value: isCheckedForListTile,
              onChanged: (value) {
                setState(() {
                  isCheckedForListTile = value!;
                });
              }),
          CheckboxListTile(
              secondary: const Icon(Icons.add),
              controlAffinity: ListTileControlAffinity.platform,
              title: const Text("Check Box List Tile"),
              subtitle: const Text("Subtitle For Checked Box List Tile"),
              value: isCheckedForListTile,
              onChanged: (value) {
                setState(() {
                  isCheckedForListTile = value!;
                });
              }),
          Checkbox(
            activeColor: Colors.amber,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            // focusColor: Colors.red,
            hoverColor: Colors.blue,
            value: isCheckedForCheckBox,
            onChanged: (value) {
              setState(() {
                isCheckedForCheckBox = value!;
              });
            },
          ),
          // const Text(
          //   "Hello Flutter",
          //   style: TextStyle(fontSize: 50),
          // )
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Hello",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                  ),
                ),
                TextSpan(
                  text: "Flutter",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 100,
                  ),
                ),
                TextSpan(
                  text: "Flutter",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: loadingValue,
          ),
          const SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            value: loadingValue,
          ),
          InkWell(
            onTap: () {
              setState(() {
                loadingValue = loadingValue + 0.1;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("The Value Incereased"),
                ),
              );
            },
            child: Text(
              (loadingValue * 10).toString(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddNewAnimalScreen extends StatelessWidget {
  AddNewAnimalScreen({super.key});

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: 'Add Your Animal Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                bool temp = await createAnimal(name.text);

                if (temp) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Success'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllAnimalScreen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Error'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text('Send TO BackEnd'))
        ],
      ),
    );
  }
}

createAnimal(String name) async {
  Dio dio = Dio();

  try {
    Response response = await dio.post(
        'https://653e6cc99e8bd3be29df4853.mockapi.io/animal',
        data: {"name": name});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

showAnimal() async {
  Dio dio = Dio();

  Response response =
      await dio.get('https://653e6cc99e8bd3be29df4853.mockapi.io/animal');
  return response.data;
}

class AllAnimalScreen extends StatelessWidget {
  const AllAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: showAnimal(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
