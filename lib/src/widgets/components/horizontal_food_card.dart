part of '../widgets.dart';

class HorizontalFoodCard extends StatelessWidget {
  final DishModel item;
  final void Function()? onTap;
  final bool isCartScreen;

  const HorizontalFoodCard({
    super.key,
    required this.item,
    this.onTap,
    this.isCartScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final colorScheme = context.theme.colorScheme;
    final translate = context.translate;

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 110,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: colorScheme.shadow, blurRadius: 4)
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 110,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: item.imagePath,
                          errorWidget: (context, url, error) =>
                              const SizedBox(),
                          imageBuilder: (context, assetProvider) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(5)),
                              child: FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: assetProvider,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      if (!isCartScreen)
                        Positioned(
                          right: 4,
                          top: 4,
                          child: InkWell(
                              onTap: () {
                                favouriteProvider.addORRemoveFavouriteDishes(
                                    item: item);
                              },
                              child: Icon(
                                favouriteProvider.favouriteDishes.contains(item)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: colorScheme.primary,
                                size: 20,
                              )),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  item.isVeg
                                      ? const VegIndicator(isVeg: true)
                                      : const VegIndicator(),
                                ],
                              ),
                              if (!isCartScreen)
                                Text(
                                  item.description,
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.grey[500]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item.price}.00",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              CartButton(
                                dish: item,
                                label: translate?.add.toUpperCase() ?? "ADD",
                                minimumSize: const Size(80, 35),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (item.outOfStock)
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: colorScheme.shadow.withOpacity(0.25),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
    );
  }
}
