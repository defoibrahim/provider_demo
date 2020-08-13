import 'package:flutter/material.dart';
import '../model/productModel.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> myList = [];
  int _counter = 0;

  addProduct() {
    Product product =
        Product("Product number ${myList.length}", "assets/food.jpg");
    myList.add(product);
    notifyListeners();
  }

  removeProduct(int index) {
    myList.removeAt(index);
    notifyListeners();
  }

  getV() => _counter;

  incrm() {
    _counter++;
    notifyListeners();
  }
}
