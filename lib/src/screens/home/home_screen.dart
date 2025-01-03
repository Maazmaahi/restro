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
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          leftButton: CustomAppBarLeftButtons.appLogo,
          title: "Biryani Mahal,Patna",
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
                        const Text(
                          "Explore Menu",
                          style: TextStyle(
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
                    const Text(
                      "Deals of The Day",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const DealsCarousel(),
                    const SizedBox(height: 20),
                    const Text(
                      "Offers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const OfferCarousel(),
                    const SizedBox(height: 20),
                    const Text(
                      "Best Sellers",
                      style: TextStyle(
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
