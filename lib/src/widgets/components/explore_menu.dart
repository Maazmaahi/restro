part of '../widgets.dart';

class ExploreMenu extends StatelessWidget {
  final List<ExploreModel> items;
  final bool isHome;

  const ExploreMenu({super.key, required this.items, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              if (isHome) {
                context.push(RoutesName.exploreMenu);
              }
              homeProvider.filterMenu = item.filter;
              homeProvider.exploreName = item.name;
              homeProvider.dishIndex = index;
              homeProvider.getFilterDishes();
            },
            child: index == 0
                ?  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: homeProvider.dishIndex == index
                            ? AppColors.primary
                            : AppColors.steelBlue,
                        maxRadius: 35,
                        child: const Text("BM"),
                      ),
                      Text("All",
                        style: TextStyle(
                        color: homeProvider.dishIndex == index
                        ? AppColors.primary
                        : AppColors.black,
                      ),)
                    ],
                  )
                : Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: item.imagePath,
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                          maxRadius: 12,
                          child: Icon(
                            Icons.food_bank_outlined,
                            size: 17,
                            color: AppColors.grey,
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: homeProvider.dishIndex == index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 4,
                              )),
                          child: CircleAvatar(
                            maxRadius: 35,
                            backgroundImage: imageProvider,
                          ),
                        ),
                      ),
                      Text(item.name,
                      style: TextStyle(
                        color: homeProvider.dishIndex == index
                            ? AppColors.primary
                            : AppColors.black,
                      ),)
                    ],
                  ),
          );
        },
      ),
    );
  }
}
