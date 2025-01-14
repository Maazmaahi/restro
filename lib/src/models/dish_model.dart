part of 'models.dart';

class DishModel {
  final int id;
  int orderedQuantity;
  final String name;
  final String slug;
  final String imagePath;
  final String price;
  final String description;
  final bool isVeg;
  final bool outOfStock;
  final String? tag;
  final String? filter;

  DishModel({
    required this.id,
    this.orderedQuantity = 0,
    required this.name,
    required this.slug,
    required this.imagePath,
    required this.price,
    required this.description,
    this.isVeg = false,
    this.outOfStock = false,
    this.tag,
    this.filter,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      orderedQuantity: int.tryParse(json["orderedQuantity"].toString()) ?? 0,
      name: json["name"],
      slug: json["slug"],
      imagePath: json["imagePath"],
      price: json["price"],
      description: json["description"],
      isVeg: json["isVeg"],
      outOfStock: json["outOfStock"],
      tag: json["tag"],
      filter: json["filter"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderedQuantity": orderedQuantity,
    "name": name,
    "slug": slug,
    "imagePath": imagePath,
    "price": price,
    "description": description,
    "isVeg": isVeg,
    "outOfStock": outOfStock,
    "tag": tag,
    "filter": filter,
  };
}