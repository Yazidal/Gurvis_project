import 'dart:ui';
import 'category.dart';

class Pathology extends Category {
  String? name;
  String? diagnostique;
  String? epidemologie;
  List? imagerie;
  String? references;
  String? imageriedescription;
  String? signes;
  String? conduite;
  String? biologie;

  Pathology(
      {this.diagnostique,
      this.name,
      this.epidemologie,
      this.imagerie,
      this.imageriedescription,
      this.references,
      this.signes,
      this.conduite,
      this.biologie});

  factory Pathology.fromJson(Map<String, dynamic> json) {
    return Pathology(
      name: json['nom'],
      diagnostique: json['diagnostique'],
      epidemologie: json['epidemologie'],
      imagerie: json['imagerie'],
      imageriedescription: json['description_imagerie'],
      signes: json['signescliniques'],
      references: json['references'],
      biologie: json['biologie'],
      conduite: json['conduite_a_tenir'],
    );
  }
  static List<Pathology> fromJsonArray(List<dynamic> jsonArray) {
    List<Pathology> pathologiesFromJson = [];

    jsonArray.forEach((jsonData) {
      pathologiesFromJson.add(Pathology.fromJson(jsonData));
    });

    return pathologiesFromJson;
  }
}
