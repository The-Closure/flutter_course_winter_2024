main() {
  Animal cat = Animal.getInstance();
  Animal dog = Animal.getInstance();

  Animal horse = Animal(name: ['world', 'again'], color: MyColor(hex: '11111'));

  horse.name = ['new world'];
  print(horse.color.hex);

  cat.name.add('hello');

  print(dog.color.hex);
}

class Animal {
  List<String> name;
  MyColor color;

  static final Animal _animal =
      Animal(name: ['pure dog'], color: MyColor(hex: '9999'));

  static getInstance() {
    return _animal;
  }

  Animal({required this.name, required this.color});
}

class MyColor {
  String hex;

  MyColor({required this.hex});
}
