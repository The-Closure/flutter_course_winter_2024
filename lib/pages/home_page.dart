import 'package:flutter/material.dart';
import 'package:flutter_ui_and_widgets/widgets/card_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Map<String, dynamic>> burger = [
    {
      'name': 'Burger1',
      'descripation': 'Burger King1',
      'imageUrl': "https://imgur.com/CUG0Aof"
    },
    {
      'name': 'Burger2',
      'descripation': 'Burger King2',
      'imageUrl': "https://imgur.com/CUG0Aof"
    },
    {
      'name': 'Burger3',
      'descripation': 'Burger King3',
      'imageUrl': "https://imgur.com/CUG0Aof"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Row(
      //   children: [
      //     CardItem(
      //       imageUrl:
      //           "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg",
      //       itemName: "Cat Name : Lolo",
      //       descripation:
      //           "Et ex esse anim officia non elit irure sint fugiat id. Nulla et quis anim consectetur officia mollit ut dolor duis pariatur tempor ullamco. Nisi magna dolore do in occaecat veniam velit ex dolore sint. Excepteur voluptate eiusmod minim dolor laborum do veniam non sit qui nisi Lorem nostrud nostrud.",
      //     ),
      //     CardItem(
      //       imageUrl: "https://imgur.com/gallery/xSDQIMF",
      //       itemName: "Three Cats",
      //       descripation:
      //           "Ipsum consequat consequat labore Lorem deserunt est dolor dolor fugiat occaecat. Proident cupidatat nulla tempor est. Laboris non nisi exercitation tempor adipisicing incididunt nisi cupidatat nisi id deserunt. Laboris consequat amet occaecat cillum nulla esse quis ut tempor.",
      //     ),
      //   ],
      // ),
      body: GridView.builder(
        // physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          childAspectRatio: 1 / 1,
        ),
        itemCount: burger.length,
        itemBuilder: (context, index) {
          return CardItem(
            imageUrl: burger[index]['imageUrl'].toString(),
            itemName: burger[index]['name'],
            descripation: burger[index]['descripation'],
          );
        },
        // children: const [
        //   CardItem(
        //       imageUrl: "https://imgur.com/CUG0Aof",
        //       itemName: "Burger",
        //       descripation: "Burger King"),
        //   CardItem(
        //       imageUrl: "https://imgur.com/CUG0Aof",
        //       itemName: "Burger",
        //       descripation: "Burger King"),
        //   CardItem(
        //       imageUrl: "https://imgur.com/CUG0Aof",
        //       itemName: "Burger",
        //       descripation: "Burger King"),
        //   CardItem(
        //       imageUrl: "https://imgur.com/CUG0Aof",
        //       itemName: "Burger",
        //       descripation: "Burger King"),
        //   CardItem(
        //       imageUrl: "https://imgur.com/CUG0Aof",
        //       itemName: "Burger",
        //       descripation: "Burger King"),
        // ],
      ),
    );
  }
}
