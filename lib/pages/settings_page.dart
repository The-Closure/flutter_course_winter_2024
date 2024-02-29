import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double sliderValue = 0;
  List options = ["Red", "Blue"];
  String item = 'item1';
  String? groupValue;
  List<Widget> listTiles = [
    const Card(
      key: ValueKey('item1'),
      child: ListTile(
        title: Text("item1"),
      ),
    ),
    const Card(
      key: ValueKey('item2'),
      child: ListTile(
        title: Text("item2"),
      ),
    ),
    const Card(
      key: ValueKey('item3'),
      child: ListTile(
        title: Text("item3"),
      ),
    ),
    const Card(
      key: ValueKey('item4'),
      child: ListTile(
        title: Text("item4"),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (context) {
              return SizedBox(
                height: 500,
                width: 500,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"),
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text("Alert Dialog"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          print("data saved");
                        },
                        child: const Text("Save"),
                      )
                    ],
                  );
                },
              );
            },
            child: const Text("Show Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AboutDialog(
                  applicationName: "Flutter App",
                  applicationIcon: FlutterLogo(),
                  applicationVersion: "1.0.0",
                  applicationLegalese: "dsljfdkfm",
                ),
              );
            },
            child: const Text("Show about dialog"),
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2050),
              );

              print(date);
            },
            child: const Text("Show Date Picker"),
          ),
          const SizedBox(
            height: 20,
          ),
          Slider(
              activeColor: Colors.amber,
              inactiveColor: Colors.orange,
              // secondaryTrackValue: 50,
              divisions: 4,
              label: sliderValue.toInt().toString(),
              max: 100,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                  print(sliderValue);
                });
              }),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListWheelScrollView(
                scrollBehavior: const CupertinoScrollBehavior(),
                physics: const AlwaysScrollableScrollPhysics(),
                itemExtent: 100,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                ]),
          ),
          ListTile(
            leading: Radio(
              value: options[0],
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
            ),
            title: const Text("Red"),
          ),
          ListTile(
            leading: Radio(
              value: options[1],
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
            ),
            title: const Text("Blue"),
          ),
          const ExpansionTile(
            // controlAffinity: ListTileControlAffinity.leading,
            // trailing: Icon(Icons.add),
            title: Text("User information"),
            children: [
              Text("Name"),
              Text("phone"),
              Text("Address"),
            ],
          ),
          DropdownButton(
            value: item,
            items: const [
              DropdownMenuItem(
                value: "item1",
                child: Text("Item1"),
              ),
              DropdownMenuItem(
                value: 'item2',
                child: Text("Item2"),
              ),
              DropdownMenuItem(
                value: 'item3',
                child: Text("Item3"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                item = value!;
              });
            },
          ),
          SizedBox(
            height: 300,
            child: ReorderableListView(
              children: listTiles,
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final temp = listTiles.removeAt(oldIndex);
                listTiles.insert(newIndex, temp);
                print("$newIndex    $oldIndex");
              },
            ),
          )
        ],
      ),
    );
  }
}
