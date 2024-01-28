

import 'package:flutter/material.dart';

class MyPerfectButtton extends StatelessWidget {
  const MyPerfectButtton(
      {super.key, required this.title, required this.action});

  final String title;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action;
      },
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        width: 317,
        height: 54,
        decoration: BoxDecoration(
            color: Color(0xff8BA8B5), borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
