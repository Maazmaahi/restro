part of 'repositories.dart';

class HomeRepository {
  Future<List<ExploreModel>> getExplore() async {
    final explores = <ExploreModel>[];
    explores
      ..clear()
      ..addAll(List<ExploreModel>.from(
          exploreJSON.map((e) => ExploreModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return explores;
  }

  Future<List<DishModel>> getDish() async {
    final dishes = <DishModel>[];
    dishes
      ..clear()
      ..addAll(List<DishModel>.from(
          dishJSON.map((e) => DishModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return dishes;
  }

  Future<List<DishModel>> getMayLikeDish() async {
    final dishes = <DishModel>[];
    dishes
      ..clear()
      ..addAll(List<DishModel>.from(
          dishMayLikeJSON.map((e) => DishModel.fromJson(e))));
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return dishes;
  }
}
