part of 'repositories.dart';

class OfferRepository {
  Future<List<OfferModel>> getOffers() async {
    final offers = <OfferModel>[];
    offers
      ..clear()
      ..addAll(List<OfferModel>.from(
          offerJSON.map((e) => OfferModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return offers;
  }
}