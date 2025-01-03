part of 'models.dart';

class OfferModel {
  final int id;
  final String coupon;
  final String title;
  final String description;
  final String discount;
  final DateTime dateOfExpiry;

  OfferModel({
    required this.id,
    required this.coupon,
    required this.title,
    required this.description,
    required this.discount,
    required this.dateOfExpiry,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: int.tryParse(json["id"].toString()) ?? 0,
      coupon: json["coupon"],
      title: json["title"],
      description: json["description"],
      discount: json["discount"],
      dateOfExpiry: json["dateOfExpiry"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "coupon": coupon,
    "title": title,
    "description": description,
    "discount": discount,
    "dateOfExpiry": dateOfExpiry,
  };
}