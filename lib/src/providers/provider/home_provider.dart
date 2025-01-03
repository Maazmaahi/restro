part of '../providers.dart';

class HomeProvider extends BaseProvider {
  final HomeRepository _homeRepository = HomeRepository();
  final explores = <ExploreModel>[];
  final dishes = <DishModel>[];
  int dishIndex = 0;
  String filterMenu = "all";
  String exploreName = "All";
  bool vegOnly = false;
  final filterDishes = <DishModel>[];
  final mayLikeDishes = <DishModel>[];

  Future<void> initializeData() async {
    explores.clear();
    dishes.clear();
    mayLikeDishes.clear();
    filterDishes.clear();
    dishIndex = 0;
    filterMenu = "all";
    exploreName = "All";
    vegOnly = false;
  }

  Future<void> getExplore() async {
    setState(ViewState.busy);
    if(explores.isEmpty) {
      final results = await _homeRepository.getExplore();
      explores.addAll(results);
    }
    setState(ViewState.idle);
  }

  void toggleVegOnly() {
    setState(ViewState.busy);
    vegOnly = !vegOnly;
    setState(ViewState.idle);
  }

  Future<void> getDishes() async {
    setState(ViewState.busy);
    if(dishes.isEmpty) {
      final results = await _homeRepository.getDish();
      dishes.addAll(results);
    }
    setState(ViewState.idle);
  }

  void getFilterDishes() {
    setState(ViewState.busy);
    if (filterMenu == "all") {
      filterDishes.clear();
    } else {
      // final results = dishes.where((item) => item.filter == filterMenu);
      final results = dishes.where((item) => item.filter!.contains(filterMenu));
      filterDishes
        ..clear()
        ..addAll(results);
    }
    setState(ViewState.idle);
  }

  Future<void> getMayLikeDishes() async {
    setState(ViewState.busy);
    if(mayLikeDishes.isEmpty) {
      final results = await _homeRepository.getMayLikeDish();
      mayLikeDishes.addAll(results);
    }
    setState(ViewState.idle);
  }
}
