import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/pathologies.dart';
import 'package:provider/provider.dart';

class CategorySelectionService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  Category? _selectedCategory;
  Pathology? _selectedPathology;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  Pathology? get selectedPathology => _selectedPathology;
  set selectedPathology(Pathology? value) {
    _selectedPathology = value;
    notifyListeners();
  }

  // void incrementPathologyAmount(BuildContext context) {
  //   if (_selectedPathology != null) {

  //     LoginService loginService = Provider.of<LoginService>(context, listen: false);
  //     CartService cartService = Provider.of<CartService>(context, listen: false);

  //     if (cartService.isPathologyAddedToCart(_selectedPathology)) {

  //       _instance = FirebaseFirestore.instance;
  //       _instance!.collection('shoppers')
  //       .doc(loginService.loggedInUserModel!.uid)
  //       .update({ 'cartItems.${selectedPathology!.imgName!}': FieldValue.increment(1) })
  //       .then((value) {
  //         _selectedPathology!.amount++;
  //         notifyListeners();
  //       });
  //     }
  //     else {
  //       _selectedPathology!.amount++;
  //       notifyListeners();
  //     }
  //   }
  // }

  // void decrementPathologyAmount(BuildContext context) {
  //   if (_selectedPathology != null) {

  //      LoginService loginService = Provider.of<LoginService>(context, listen: false);
  //      CartService cartService = Provider.of<CartService>(context, listen: false);

  //     if (cartService.isPathologyAddedToCart(_selectedPathology)) {
  //       _instance = FirebaseFirestore.instance;
  //       _instance!.collection('shoppers')
  //       .doc(loginService.loggedInUserModel!.uid)
  //       .update({ 'cartItems.${selectedPathology!.imgName!}': FieldValue.increment(-1) })
  //       .then((value) {
  //         _selectedPathology!.amount--;
  //         notifyListeners();
  //       });
  //     }
  //     else {
  //       _selectedPathology!.amount--;
  //       notifyListeners();
  //     }
  //   }
  // }

  // int get PathologyAmount {
  //   int subCatAmount = 0;
  //   if (_selectedPathology != null) {
  //     subCatAmount = _selectedPathology!.amount;
  //   }
  //   return subCatAmount;
  // }
}
