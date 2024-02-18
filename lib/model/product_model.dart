// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String title;
  String thumbnail;
  num price;
  ProductModel({
    required this.title,
    required this.thumbnail,
    required this.price,
  });

  ProductModel copyWith({
    String? title,
    String? thumbnail,
    num? price,
  }) {
    return ProductModel(
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(title: $title, thumbnail: $thumbnail, price: $price)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.thumbnail == thumbnail &&
      other.price == price;
  }

  @override
  int get hashCode => title.hashCode ^ thumbnail.hashCode ^ price.hashCode;
}
