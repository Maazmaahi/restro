part of 'models.dart';

class LanguageModel {
  final int id;
  final String name;
  final String code;
  final String translation;

  LanguageModel({
    required this.id,
    required this.name,
    required this.code,
    required this.translation,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      name: json["name"],
      code: json["code"],
      translation: json["translation"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "translation": translation,
  };
}
