import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cores/cores.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late OfferProvider offerProvider = OfferProvider();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    await offerProvider.getOffers();
  }

  @override
  Widget build(BuildContext context) {
    offerProvider = Provider.of<OfferProvider>(context);
    final colorScheme = context.theme.colorScheme;
    final translate = context.translate;

    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.appLogo,
      title: translate?.offers ?? "Offers",
      body: offerProvider.offers.isEmpty
          ? const AppLoader()
          : ListView.separated(
              itemCount: offerProvider.offers.length,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = offerProvider.offers[index];

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: colorScheme.shadow, blurRadius: 4)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.red),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.coupon,
                            style: const TextStyle(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: AppColors.lightBlue,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 8),
                      Text(item.description, maxLines: 2),
                      const AppDivider(),
                      Text(item.dateOfExpiry.toStringByFormat("dd MMM, yyyy")),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
