part of '../providers.dart';


class CartProvider extends BaseProvider {
  final favouriteDishes = <DishModel>[];

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