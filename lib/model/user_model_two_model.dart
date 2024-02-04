// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
String street;
String city;
  AddressModel({
    required this.street,
    required this.city,
  });


  AddressModel copyWith({
    String? street,
    String? city,
  }) {
    return AddressModel(
      street: street ?? this.street,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddressModel(street: $street, city: $city)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.street == street &&
      other.city == city;
  }

  @override
  int get hashCode => street.hashCode ^ city.hashCode;
}


class UserNewModel {
  String name;
  String email;
  AddressModel address;
  UserNewModel({
    required this.name,
    required this.email,
    required this.address,
  });

  UserNewModel copyWith({
    String? name,
    String? email,
    AddressModel? address,
  }) {
    return UserNewModel(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'address': address.toMap(),
    };
  }

  factory UserNewModel.fromMap(Map<String, dynamic> map) {
    return UserNewModel(
      name: map['name'] as String,
      email: map['email'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNewModel.fromJson(String source) => UserNewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserNewModel(name: $name, email: $email, address: $address)';

  @override
  bool operator ==(covariant UserNewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ address.hashCode;
}
