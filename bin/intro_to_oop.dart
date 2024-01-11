 main()async {
 var temp = await getProducts();
  print(temp);
  draw(Reactangle());
}

 Future getProducts() async {

  await Future.delayed(Duration(seconds: 3));

  return 3;
  
}

abstract class Creature {
  String name;
  int id;
  Creature({required this.id, required this.name});

  drink();
}

class Animal extends Creature {
  String color;
  Animal({required super.id, required super.name, required this.color});

  @override
  drink() {
    print("Animal Drinking");
  }
}

draw(Shape data) {
  if (data is Reactangle) {
    print("^^^^^^^^^^^^^^^");
  } else {
    print("################");
  }
}

class Reactangle extends Shape {}

class Squere extends Shape {}

abstract class Shape {}
