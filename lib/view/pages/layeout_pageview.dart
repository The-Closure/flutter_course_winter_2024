
import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/view/widget/my_button.dart';

class PlanAndGoScreen extends StatelessWidget {
  PlanAndGoScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.index, required this.action});

  final String image;
  final String title;
  final String subtitle;
  final double index;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: () {}, child: Text("skip"))),
          ),
          Image.asset(image),
          Text(
            title,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(subtitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff999999))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: 10,
                child: CircleAvatar(
                  backgroundColor:
                      (index == 0) ? Color(0xff8BA8B5) : Color(0xffd9d9d9),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox.square(
                  dimension: 10,
                  child: CircleAvatar(
                    backgroundColor:
                        (index == 1) ? Color(0xff8BA8B5) : Color(0xffd9d9d9),
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 10,
                child: CircleAvatar(
                  backgroundColor:
                      (index == 2) ? Color(0xff8BA8B5) : Color(0xffd9d9d9),
                ),
              )
            ],
          ),
          MyPerfectButtton(
            title: 'Next',
            action: (){
              action;
            },
          )
        ],
      ),
    );
  }
}
