import 'dart:convert';

import 'product_model.dart';

class CardModel {
  int quantity;
  final ProductModel product;
  CardModel({
    required this.quantity,
    required this.product,
  });

  CardModel copyWith({
    int? quantity,
    ProductModel? product,
  }) {
    return CardModel(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      quantity: map['quantity'],
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source));

  @override
  String toString() => 'CardModel(quantity: $quantity, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardModel &&
        other.quantity == quantity &&
        other.product == product;
  }

  @override
  int get hashCode => quantity.hashCode ^ product.hashCode;
}
