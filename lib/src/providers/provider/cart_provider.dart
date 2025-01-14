part of '../providers.dart';

class CartProvider extends BaseProvider {
  final dishes = <DishModel>[];
  int totalQuantity = 0;
  double itemTotalPrice = 0;
  double netTotalPrice = 0;
  double grandTotalPrice = 0;
  double taxes = 0;
  bool optZeroContact = false;

  void toggleOptZeroContact(val) {
    setState(ViewState.busy);
    optZeroContact = !optZeroContact;
    setState(ViewState.idle);
  }

  void calculatePrice() {}

  void clearDishes() {
    setState(ViewState.busy);
    for (DishModel dish in dishes) {
      dish.orderedQuantity = 0;
    }
    dishes.clear();
    totalQuantity = 0;
    itemTotalPrice = 0;
    netTotalPrice = 0;
    grandTotalPrice = 0;
    taxes = 0;
    setState(ViewState.idle);
  }

  void addOrRemoveCart({required DishModel item}) {
    setState(ViewState.busy);
    if (dishes.contains(item) && item.orderedQuantity > 0) {
      item.orderedQuantity--;
      totalQuantity--;
      dishes.remove(item);
    } else {
      item.orderedQuantity++;
      itemTotalPrice += double.parse(item.price.replaceAll("₹ ", ""));
      dishes.add(item);
      totalQuantity++;

      netTotalPrice = itemTotalPrice;
      taxes = itemTotalPrice * 0.05;
      grandTotalPrice = itemTotalPrice + taxes;
    }
    setState(ViewState.idle);
  }

  void increaseOrDecreaseQuantity({
    required DishModel item,
    bool increase = false,
  }) {
    setState(ViewState.busy);
    for (DishModel dish in dishes) {
      if (dish.id == item.id) {
        double itemPrice = double.parse(item.price.replaceAll("₹ ", ""));
        double tax = itemPrice * 0.05;
        if (increase) {
          dish.orderedQuantity++;
          totalQuantity++;
          itemTotalPrice += itemPrice;
          taxes += tax;
        } else {
          dish.orderedQuantity--;
          totalQuantity--;
          itemTotalPrice -= itemPrice;
          taxes -= tax;
        }
        netTotalPrice = itemTotalPrice;
        grandTotalPrice = itemTotalPrice + taxes;
        item.orderedQuantity = dish.orderedQuantity;
        if (dish.orderedQuantity == 0) {
          if (dishes.length == 1) {
            itemTotalPrice = 0;
            netTotalPrice = 0;
            grandTotalPrice = 0;
            taxes = 0;
          }
          dishes.remove(dish);
          break;
        }
      }
    }
    setState(ViewState.idle);
  }
}
