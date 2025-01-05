import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          title: "${translate?.biryaniMahal ?? "Biryani Mahal"}, ${translate?.patna ?? "Patna"}",
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
              padding: const EdgeInsets.all(20),
              physics: const ClampingScrollPhysics(),
              child: AppPullRefresh(
                onRefresh: () async {
                  // await _loadData();
                },
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
                        ExploreMenu(items: homeProvider.explores, isHome: true),
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
                    const SizedBox(height: 20),
                    const DealsCarousel(),
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
            ),
    );
  }
}
