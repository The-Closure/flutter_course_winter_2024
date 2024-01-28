
import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';

class CircleAvatarWidget extends StatefulWidget {
  const CircleAvatarWidget({super.key});

  @override
  State<CircleAvatarWidget> createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  Color color = Colors.green;
  Color color1 = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                if (controller.page == 1) {
                  color1 = Colors.green;

                  controller.nextPage(
                      duration: Duration(seconds: 3),
                      curve: Curves.bounceInOut);
                } else {
                  color1 = Colors.red;
                }
              });
            },
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
        ),
        Text(controller.page.toString()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                color1 = Colors.green;
              });
            },
            child: CircleAvatar(
              backgroundColor: color1,
            ),
          ),
        )
      ],
    );
  }
}
