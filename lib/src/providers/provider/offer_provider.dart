part of '../providers.dart';

class OfferProvider extends BaseProvider {
  final OfferRepository _offerRepository = OfferRepository();
  final offers = <OfferModel>[];

  Future<void> initializeData() async {
    offers.clear();
  }

  Future<void> getOffers() async {
    setState(ViewState.busy);
    if (offers.isEmpty) {
      final results = await _offerRepository.getOffers();
      offers.addAll(results);
    }
    setState(ViewState.idle);
  }
}
