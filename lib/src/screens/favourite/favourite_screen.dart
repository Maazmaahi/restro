import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/cores/cores.dart';

import '../../providers/providers.dart';
import '../../routes/routes.dart';
import '../../widgets/widgets.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final translate = context.translate;

    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.appLogo,
      title: translate?.favourite ?? "Favourites",
      body: favouriteProvider.favouriteDishes.isEmpty
          ? Center(
              child: Text(translate?.noDataFound ?? "No Data Found"),
            )
          : ListView.separated(
              itemCount: favouriteProvider.favouriteDishes.length,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = favouriteProvider.favouriteDishes[index];
                return HorizontalFoodCard(
                    item: item,
                    onTap: () {
                      final Map<String, dynamic> extra = {
                        "dish": item,
                        "showOtherDishesMayLike": true
                      };
                      context.push(RoutesName.dishDetails, extra: extra);
                    });
              },
            ),
    );
  }
}
