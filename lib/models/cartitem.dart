import 'package:flutter_application_1/models/category.dart';

class CartItem {
  Category? category;
  int units;

  CartItem({this.category, this.units = 0});
}
