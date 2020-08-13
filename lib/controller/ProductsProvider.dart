import 'package:flutter/material.dart';
import 'package:productsstore/model/productModel.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> myList = [];
  addProduct() {
    Product product =
        Product("Product number ${myList.length}", "assets/food.jpg");
    myList.add(product);
    notifyListeners();
  }
}
