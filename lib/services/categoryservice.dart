import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/category.dart';

class CategoryService {
  FirebaseFirestore? _instance;

  List<Category> _categories = [];
  List<Category> getCategories() {
    return _categories;
  }

// working model
  // Future<void> getCategoriesCollectionFromFirebase() async {
  //   _instance = FirebaseFirestore.instance;
  //   CollectionReference categories = _instance!.collection("test");
  //   DocumentSnapshot snapshot = await categories.doc('categories').get();
  //   var data = snapshot.data() as Map;
  //   var categoriesData = data['categories'] as List<dynamic>;

  //   categoriesData.forEach((catData) {
  //     Category cat = Category.fromJson(catData);
  //     _categories.add(cat);
  //     print('les categories : ${cat}');
  //   });
  // }

//testing another model

  Future<void> test() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection("categories");
    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories'] as List<dynamic>;

    categoriesData.forEach((catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
      print('les categories : ${cat}');
    });
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var data = doc.data() as dynamic;
        Category cat = Category.fromJson(data);
        _categories.add(cat);

        print(doc["Nom"]);
      });

      print('les categories : ${_categories.map((e) => e.pathologies)}');
    });
  }
}
