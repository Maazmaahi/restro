part of '../providers.dart';


class FavouriteProvider extends BaseProvider {
  final favouriteDishes = <DishModel>[];

  Future<void> initializeData() async {
    favouriteDishes.clear();
  }

  void addORRemoveFavouriteDishes({required DishModel item}) {
    setState(ViewState.busy);
    if (favouriteDishes.contains(item)) {
      favouriteDishes.remove(item);
    } else {
      favouriteDishes.add(item);
    }
    setState(ViewState.idle);
  }

}