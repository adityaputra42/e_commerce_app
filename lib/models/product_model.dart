part of 'model.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoriesModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GaleryModel>? galleries;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      price: double.parse(json["price"].toString()),
      description: json["description"],
      tags: json["tags"],
      category: CategoriesModel.fromJson(json["category"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      galleries: json["galleries"]
          .map<GaleryModel>((galleries) => GaleryModel.fromJson(galleries))
          .toList()
      // galleries: List<GaleryModel>.from(json["galleries"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "category": category!.toJson(),
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "galleries": galleries!.map((gallery) => gallery.toJson()).toList()
        //List<GaleryModel>.from(galleries!.map((x) => x)),
      };
}
