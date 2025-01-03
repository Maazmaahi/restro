part of 'models.dart';

class ExploreModel {
  final int id;
  final String name;
  final String slug;
  final String imagePath;
  final String price;
  final String filter;
  final String? description;

  ExploreModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imagePath,
    required this.price,
    required this.filter,
    this.description,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      name: json["name"],
      slug: json["slug"],
      imagePath: json["imagePath"],
      price: json["price"],
      filter: json["filter"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "imagePath": imagePath,
    "price": price,
    "filter": filter,
    "description": description,
  };
}