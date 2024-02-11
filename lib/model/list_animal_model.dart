// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:service_layer_clean/model/animal_model.dart';
import 'package:service_layer_clean/model/result_model.dart';

// TODO : Recommended To Search
// class GenericList<T> extends ResultModel {

//   List<T> genericList;

//   GenericList({required this.genericList});
// }

class ListAnimalModel extends ResultModel {
  List<AnimalModel> animals;
  ListAnimalModel({
    required this.animals,
  });

  ListAnimalModel copyWith({
    List<AnimalModel>? animals,
  }) {
    return ListAnimalModel(
      animals: animals ?? this.animals,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'animals': animals.map((x) => x.toMap()).toList(),
    };
  }

  factory ListAnimalModel.fromMap(Map<String, dynamic> map) {
    return ListAnimalModel(
      animals: List<AnimalModel>.from(
        (map['animals'] as List<int>).map<AnimalModel>(
          (x) => AnimalModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListAnimalModel.fromJson(String source) =>
      ListAnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListAnimalModel(animals: $animals)';

  @override
  bool operator ==(covariant ListAnimalModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.animals, animals);
  }

  @override
  int get hashCode => animals.hashCode;
}
