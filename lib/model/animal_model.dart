// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:service_layer_clean/model/result_model.dart';

class AnimalModel extends ResultModel{
  String name;
  String color;
  AnimalModel({
    required this.name,
    required this.color,
  });

  AnimalModel copyWith({
    String? name,
    String? color,
  }) {
    return AnimalModel(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'color': color,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      name: map['name'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) => AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AnimalModel(name: $name, color: $color)';

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}
