import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/models/models.dart';
import 'package:restro/src/routes/routes.dart';
import 'package:restro/src/widgets/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../providers/providers.dart';

class BestSeller extends StatelessWidget {
  final List<DishModel> dishes;

  const BestSeller({super.key, required this.dishes});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return SizedBox(
      height: 305,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dishes.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemBuilder: (context, index) {
          final item = dishes[index];
          return InkWell(
            onTap: () {
              final Map<String, dynamic> extra = {
                "dish": item,
                "showOtherDishesMayLike": true
              };
              context.push(RoutesName.dishDetails, extra: extra);
            },
            child: Stack(
              children: [
                Ink(
                  width: 280,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: AppColors.shadowColor, blurRadius: 4)
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 280,
                        child: CachedNetworkImage(
                          imageUrl: item.imagePath,
                          errorWidget: (context, url, error) =>
                              const SizedBox(),
                          imageBuilder: (context, assetProvider) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8)),
                              child: FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: assetProvider,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                item.isVeg
                                    ? const VegIndicator(isVeg: true)
                                    : const VegIndicator(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                                child: Text(
                              item.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${item.price}.00",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                item.outOfStock
                                    ? const Text(
                                        "Out of Stock",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.red),
                                      )
                                    : PrimaryButton(
                                        text: "ADD", onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (item.outOfStock)
                  Container(
                    width: 280,
                    height: 305,
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        favouriteProvider.addORRemoveFavouriteDishes(item: item);
                      },
                      icon: Icon(
                        favouriteProvider.favouriteDishes.contains(item)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColors.white,
                        size: 25,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
