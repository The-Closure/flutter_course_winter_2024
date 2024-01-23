main() {
  Human ahmad = Human.Doctor('Ahmad');

  print(ahmad.name);

  List marks = List.generate(20, (index) {
    return 64;
  });

  print(marks);
}

class Human {
  String name;

  Human({required this.name});

  factory Human.Doctor(String name) {
    return Human(name: 'Dr.${name}');
  }
}
