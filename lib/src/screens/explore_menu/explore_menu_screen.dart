import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../routes/routes.dart';
import '../../widgets/widgets.dart';

class ExploreMenuScreen extends StatelessWidget {
  const ExploreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              leftButton: CustomAppBarLeftButtons.back,
              title: "Explore Menu",
            )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ExploreMenu(items: homeProvider.explores),
              const AppDivider(),
              Row(
                children: [
                  const VegIndicator(isVeg: true),
                  const SizedBox(width: 10),
                  const Text(
                    "Veg Only",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  CupertinoSwitch(
                      value: homeProvider.vegOnly,
                      onChanged: (value) {
                        homeProvider.toggleVegOnly();
                      }),
                ],
              ),
              const SizedBox(height: 10),
              homeProvider.dishIndex != 0 && homeProvider.filterDishes.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                            "No Data Found in ${homeProvider.exploreName}."),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: homeProvider.dishIndex == 0
                            ? homeProvider.dishes.length
                            : homeProvider.filterDishes.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final item = homeProvider.dishIndex == 0
                              ? homeProvider.dishes[index]
                              : homeProvider.filterDishes[index];
                          if (homeProvider.vegOnly && !item.isVeg) {
                            return const SizedBox();
                          }
                          return HorizontalFoodCard(
                              item: item,
                              onTap: () {
                                final Map<String, dynamic> extra = {
                                  "dish": item,
                                  "showOtherDishesMayLike": true
                                };
                                context.push(RoutesName.dishDetails,
                                    extra: extra);
                              });
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
