import 'dart:convert';

class ProductModel {
  final String name;
  final String image;
  final double price;
  ProductModel({
    required this.name,
    required this.image,
    required this.price,
  });

  ProductModel copyWith({
    String? name,
    String? image,
    double? price,
  }) {
    return ProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      image: map['image'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductModel(name: $name, image: $image, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.name == name &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ price.hashCode;
}
