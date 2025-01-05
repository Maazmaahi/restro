part of 'models.dart';

class ThemeModel {
  final int id;
  final String name;
  final String code;

  ThemeModel({
    required this.id,
    required this.name,
    required this.code,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      name: json["name"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}
