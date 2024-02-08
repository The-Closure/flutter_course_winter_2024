import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.amber,
                    child: const FittedBox(
                      child: Icon(
                        Icons.abc_outlined,
                        size: 500,
                      ),
                    ),
                  ),
                ),
                // const Spacer(
                //   flex: ,
                // ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          } else {
            return Container(
              color: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
