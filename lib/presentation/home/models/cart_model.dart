// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_onlineshop_apps/data/models/responses/product_response_model.dart';

class CartItem {
  Product product;
  int quantity;
  CartItem({
    required this.product,
    required this.quantity,
  });

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.product == product &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;

  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() => 'CartItem(product: $product, quantity: $quantity)';
}
