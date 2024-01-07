main() {
//   // const int degree = 49;

//   // degree = 40;

//   // final int anouther_degree;

//   // anouther_degree=60;

//   late int peoplation;

//   peoplation = 20;

//   print(peoplation);

//   int counter = 5;
//   double percent = 5.4;

//   num age = 13;

//   String name = "Abdalziz";
//   bool isFavoraite = true;

// // var gender = "Male";

// // gender = 18;

//   print(counter);

//   dynamic number = 20;

//   number = "20";

//   List names = ["Ahmad", "Abdalziz", "Alaa", 20, 30.4, true];

//   print(names.elementAt(0));

//   Map<String, num> table = {"Damascus": 30, "Aleppo": 34, "Homs": 40};

//   print(table.keys.elementAt(0));

// // Map
// // Set

//   Map<String, List> nestsMap = {
//     "Ahmad": [59, 59, 59, 60],
//     "Abdalaziz": [20, 20, 90, 90],
//     "Noor": [100, 100, 100, 0]
//   };

//   print(nestsMap["Ahmad"]![2]);

//   List<Map<String, Map>> nestDoubleMap = [
//     {
//       "User": {
//         "Name": "Ahmad",
//         "Marks": [20, 30, 70, 70]
//       }
//     }
//   ];

//   print(nestDoubleMap.elementAt(0).values.elementAt(0).values.elementAt(1).elementAt(1));

  Animal cat = Animal(age: 20, name: "katty", origin: 'Syria', type: 'hasky');

  Animal cat1 = Animal(age: 20, name: "katty", origin: 'Syria', type: 'hasky');

  Cat Katy = Cat(age: 10, name: 'katy', origin: 'Syria', type: 'shanshela',color: 'red');

  Katy.mewo();

  if(cat.name == cat1.name){
    print('yes');
  }else {
    print('no');
  }

  if(cat is Animal){
  print('Yes It is an Animal');
  }
  cat.eat();
  cat.drink();

  print(cat.age);
  

  int result = addNumbers(20, 30, 30, thirsNumber: 30,fifth: 40);
  print(result);



  // ? Different Between Upper Class with Sub Class  
  // Cat lolo = Animal(age: age, name: name, origin: origin, type: type,);


  Animal lolo1 = Cat(age: 20, name: 'name', origin: 'origin', type: 'type',color: 'Red');





}

int addNumbers(int firstNumber, int secondNumber, int fourthNumber,
    {required int thirsNumber, int fifth = 0}) {
  return firstNumber + secondNumber + thirsNumber+fifth+fourthNumber;
}


class Animal {
  String name;
  String type;
  int age;
  String origin;

Animal({required this.age,required this.name,required this.origin,required this.type});

  eat(){
    print("I am eating");
  }

  
  drink(){
    print("I am drinking");
  }
}

class Cat extends Animal {
  String color;
  Cat({required super.age, required super.name, required super.origin, required super.type,required this.color});


mewo(){
  print('cat said Mewo');
}

}