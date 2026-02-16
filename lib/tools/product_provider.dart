import 'package:flutter/material.dart';
import 'package:route_practice/tools/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> cartItems = [];

  final Map<String, int> quantities = {};

  int getQuantity(ProductModel product) {
    return quantities[product.id.toString()] ?? 0;
  }

  void addProduct(ProductModel product) {
    if (cartItems.contains(product)) {
      quantities[product.id.toString()] =
          (quantities[product.id.toString()] ?? 1) + 1;
    } else {
      cartItems.add(product);
      quantities[product.id.toString()] = 1;
    }
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    cartItems.remove(product);
    quantities.remove(product.id.toString());
    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    if (cartItems.contains(product)) {
      quantities[product.id.toString()] =
          (quantities[product.id.toString()] ?? 1) + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(ProductModel product) {
    if (cartItems.contains(product)) {
      int current = quantities[product.id.toString()] ?? 1;
      if (current > 1) {
        quantities[product.id.toString()] = current - 1;
      } else {
        removeProduct(product);
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0.0;
    for (var product in cartItems) {
      int quantity = quantities[product.id.toString()] ?? 1;
      total += product.price * quantity;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
    quantities.clear();
    notifyListeners();
  }
}
