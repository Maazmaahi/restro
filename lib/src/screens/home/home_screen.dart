import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restro/src/screens/home/deals_swiper.dart';

import '../../cores/cores.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'best_seller.dart';
import 'deals_carousel.dart';
import 'offers_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider = HomeProvider();
  late AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    await homeProvider.getExplore();
    await homeProvider.getDishes();
    await homeProvider.getMayLikeDishes();
    await authProvider.getLanguages();
    await authProvider.getThemes();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    authProvider = Provider.of<AuthProvider>(context);
    final translate = context.translate;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leftButton: CustomAppBarLeftButtons.appLogo,
          title:
              "${translate?.biryaniMahal ?? "Biryani Mahal"}, ${translate?.patna ?? "Patna"}",
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             FaIcon(FontAwesomeIcons.locationPin,
      //                 color: AppColors.primary),
      //             const SizedBox(width: 8),
      //             const Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 Text(
      //                   "Delivery to : ",
      //                   style: TextStyle(
      //                     color: AppColors.grey,
      //                     fontSize: 12,
      //                   ),
      //                 ),
      //                 Text(
      //                   "Gandhi Maidan, Patna",
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const Spacer(),
      //             AppOutlinedButton(onPressed: () {}, text: "CHANGE")
      //           ],
      //         ),
      //       ),
      //       const AppDivider(),
      //     ],
      //   ),
      // ),
      body: homeProvider.explores.isEmpty
          ? const AppLoader()
          : SingleChildScrollView(
              primary: true,
              physics: const ClampingScrollPhysics(),
              child: AppPullRefresh(
                onRefresh: () async {
                  // await _loadData();
                },
                child: Column(
                  children: [
                    _buildHeader(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translate?.exploreMenu ?? "Explore Menu",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ExploreMenu(
                                  items: homeProvider.explores, isHome: true),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            translate?.dealsOfTheDay ?? "Deals of The Day",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          // const DealsSwiper(),
                          const SizedBox(height: 20),
                          const DealsCarousel(),
                          const SizedBox(height: 20),
                          _bbqWidget(),
                          const SizedBox(height: 20),
                          Text(
                            translate?.offers ?? "Offers",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const OfferCarousel(),
                          const SizedBox(height: 20),
                          _happyHoursWidget(),
                          const SizedBox(height: 20),
                          Text(
                            translate?.bestSellers ?? "Best Sellers",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          BestSeller(dishes: homeProvider.dishes),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildHeader() {
    final colorScheme = context.theme.colorScheme;
    return Stack(
      children: [
        const AppNetworkImage(
          imagePath:
              "https://goldenrod-mongoose-569077.hostingersite.com/wp-content/uploads/2025/01/Screenshot-2025-01-05-212200.png",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Text(
                "Best in Patna, Bihar",
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Biryani & BBQ",
                style: TextStyle(
                  color: AppColors.webPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Consectetur adipiscing elit elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.​ Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bbqWidget() {
    final colorScheme = context.theme.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: colorScheme.shadow, blurRadius: 4)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: AppNetworkImage(
                    imagePath:
                        "https://goldenrod-mongoose-569077.hostingersite.com/wp-content/uploads/2025/01/bbbq-free-img.png",
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(width: 10),
                const Text(
                  "The BBQ Place.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Our Delicious Story",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: context.screenWidth - 80,
              child: const Row(
                children: [
                  AppNetworkImage(
                    imagePath:
                        "https://goldenrod-mongoose-569077.hostingersite.com/wp-content/uploads/2019/12/barbecue-foods-2.jpg",
                    radius: 4,
                  ),
                  SizedBox(width: 20),
                  AppNetworkImage(
                    imagePath:
                        "https://goldenrod-mongoose-569077.hostingersite.com/wp-content/uploads/2019/12/barbecue-food-1.jpg",
                    radius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(text: "Reservations", onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _happyHoursWidget() {
    final colorScheme = context.theme.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: colorScheme.shadow, blurRadius: 4)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: AppNetworkImage(
                    imagePath:
                        "https://goldenrod-mongoose-569077.hostingersite.com/wp-content/uploads/2025/01/bbbq-free-img.png",
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Happy Hours",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Enjoy 50% Off on All Drinks",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Every Thursday, 4PM – 7PM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child:
                      PrimaryButton(text: "Reserve a Table", onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
