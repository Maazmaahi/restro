import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/cores/cores.dart';
import 'package:restro/src/models/models.dart';
import 'package:restro/src/providers/providers.dart';
import 'package:restro/src/routes/routes.dart';
import 'package:restro/src/widgets/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class DishDetailsScreen extends StatelessWidget {
  final DishModel dish;
  final bool showOtherDishesMayLike;

  const DishDetailsScreen({
    super.key,
    required this.dish,
    required this.showOtherDishesMayLike,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final colorScheme = context.theme.colorScheme;

    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.back,
      actions: [
        IconButton(
            onPressed: () {
              favouriteProvider.addORRemoveFavouriteDishes(
                  item: dish);
            },
            icon: Icon(
              favouriteProvider.favouriteDishes.contains(dish)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: colorScheme.primary,
              size: 25,
            )),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: context.screenWidth,
              child: CachedNetworkImage(
                imageUrl: dish.imagePath,
                errorWidget: (context, url, error) => const SizedBox(),
                imageBuilder: (context, assetProvider) {
                  return FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: assetProvider,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        dish.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      dish.isVeg
                          ? const VegIndicator(isVeg: true)
                          : const VegIndicator(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${dish.price}.00",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    dish.description,
                    style: TextStyle(
                      color: AppColors.grey[700],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dish.outOfStock
                          ? const Text(
                              "Out of Stock",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.red),
                            )
                          : Expanded(
                              child: PrimaryButton(
                                text: "+ Add to cart",
                                onPressed: () {},
                              ),
                            ),
                    ],
                  ),
                  const AppDivider(),
                  if (showOtherDishesMayLike)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Other dishes you may like",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 275,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            itemCount: homeProvider.mayLikeDishes.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 15),
                            itemBuilder: (context, index) {
                              final item = homeProvider.mayLikeDishes[index];
                              return InkWell(
                                onTap: () {
                                  final Map<String, dynamic> extra = {
                                    "dish": item,
                                    "showOtherDishesMayLike": false,
                                  };
                                  context.push(RoutesName.dishDetails,
                                      extra: extra);
                                },
                                child: Stack(
                                  children: [
                                    Ink(
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: colorScheme.surface,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: colorScheme.shadow,
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 180,
                                            child: CachedNetworkImage(
                                              imageUrl: item.imagePath,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const SizedBox(),
                                              imageBuilder:
                                                  (context, assetProvider) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              5)),
                                                  child: FadeInImage(
                                                    placeholder: MemoryImage(
                                                        kTransparentImage),
                                                    image: assetProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 140,
                                                      height: 40,
                                                      child: Text(
                                                        item.name,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    item.isVeg
                                                        ? const VegIndicator(
                                                            isVeg: true)
                                                        : const VegIndicator(),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "${item.price}.00",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    item.outOfStock
                                                        ? const SizedBox(
                                                            height: 45,
                                                            child: Center(
                                                              child: Text(
                                                                "Out of Stock",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        AppColors
                                                                            .red),
                                                              ),
                                                            ),
                                                          )
                                                        : Expanded(
                                                            child:
                                                                PrimaryButton(
                                                                    text: "ADD",
                                                                    onPressed:
                                                                        () {}),
                                                          ),
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
                                        width: 180,
                                        height: 248,
                                        decoration: BoxDecoration(
                                          color:
                                              colorScheme.shadow.withOpacity(0.25),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    Positioned(
                                      right: 4,
                                      top: 4,
                                      child: InkWell(
                                          onTap: () {
                                            favouriteProvider
                                                .addORRemoveFavouriteDishes(
                                                    item: item);
                                          },
                                          child: Icon(
                                            favouriteProvider.favouriteDishes
                                                    .contains(item)
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: colorScheme.primary,
                                            size: 25,
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
