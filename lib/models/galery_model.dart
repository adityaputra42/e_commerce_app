part of 'model.dart';

class GaleryModel {
  GaleryModel({
    this.id,
    this.url,
  });

  int? id;
  String? url;

  factory GaleryModel.fromJson(Map<String, dynamic> json) => GaleryModel(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
