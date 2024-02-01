import 'package:flutter/material.dart';

class DetailsItemPage extends StatelessWidget {
  const DetailsItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: 'detailsView',
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3CQDEO83utmrNSsVt4QtJrmGqM2Dg0gej5g&usqp=CAU"),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
              "Labore commodo ullamco magna minim sint nisi veniam culpa officia pariatur exercitation. In exercitation culpa eu occaecat sint magna ad. Ut tempor elit duis excepteur ullamco. Laborum nostrud incididunt in ipsum. Culpa voluptate velit nulla labore labore officia id. Et non aute incididunt officia dolore elit duis proident id officia proident."),
        ],
      ),
    );
  }
}
