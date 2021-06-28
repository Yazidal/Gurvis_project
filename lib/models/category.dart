import 'package:flutter_application_1/models/pathologies.dart';

class Category {
  String? name;
  String? description;
  List<Pathology>? pathologies;

  Category({this.name, this.pathologies, this.description});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        name: json['Nom'],
        // description: json['description'],
        pathologies: Pathology.fromJsonArray(json['pathologies']));
  }
}
