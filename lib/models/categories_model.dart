part of 'model.dart';

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
