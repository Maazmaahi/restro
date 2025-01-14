import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cores/cores.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final colorScheme = context.theme.colorScheme;
    final translate = context.translate;

    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.appLogo,
      title: translate?.cart ?? "Cart",
      actions: cartProvider.dishes.isNotEmpty
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () => cartProvider.clearDishes(),
                  child: Text(translate?.clearCart ?? "Clear Cart"),
                ),
              )
            ]
          : null,
      body: cartProvider.dishes.isEmpty
          ? Center(
              child: Text(translate?.noDataFound ?? "No Data Found"),
            )
          : SingleChildScrollView(
              primary: true,
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      translate?.item ?? "Item",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: cartProvider.dishes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = cartProvider.dishes[index];

                      return HorizontalFoodCard(item: item, isCartScreen: true);
                    },
                  ),
                  const SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.shadow,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              translate?.optInForZeroContactDelivery ??
                                  "Opt in for Zero Contact Delivery",
                              style: TextStyle(
                                color: colorScheme.primary,
                              ),
                            ),
                            subtitle: Text(
                              translate
                                      ?.ourDeliveryPartnerWillLeaveTheOrderAtYourDoorGate ??
                                  "Our delivery partner will leave the order at your door/gate",
                              style: const TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                            value: cartProvider.optZeroContact,
                            onChanged: cartProvider.toggleOptZeroContact,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.shadow,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(translate?.billingDetails ?? "Billing Details"),
                          const SizedBox(height: 8),
                          _buildCartPriceText(
                            label: translate?.itemTotal ?? "Item Total",
                            price: "₹ ${cartProvider.itemTotalPrice}",
                          ),
                          const SizedBox(height: 4),
                          _buildCartPriceText(
                            label: translate?.deliveryCharges ??
                                "Delivery Charges",
                            price: "+₹ 0.00",
                          ),
                          const SizedBox(height: 4),
                          _buildCartPriceText(
                            label:
                                translate?.packingCharges ?? "Packing Charges",
                            price: "+₹ 0.00",
                          ),
                          const SizedBox(height: 4),
                          _buildCartPriceText(
                            label: translate?.netTotal ?? "Net Total",
                            price: "₹ ${cartProvider.netTotalPrice}",
                          ),
                          const SizedBox(height: 4),
                          _buildCartPriceText(
                            label: translate?.taxes ?? "Taxes",
                            price:
                                "+₹ ${cartProvider.taxes.toStringAsFixed(2)}",
                          ),
                          const SizedBox(height: 4),
                          _buildCartPriceText(
                            label: translate?.grandTotal ?? "Grand Total",
                            price: "₹ ${cartProvider.grandTotalPrice}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottom: cartProvider.dishes.isEmpty
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: colorScheme.shadow)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(translate?.totalBillAmount ?? "Total Bill Amount"),
                      Text("₹ ${cartProvider.grandTotalPrice}"),
                    ],
                  ),
                  PrimaryButton(
                      text: translate?.placeOrder ?? "Place Order",
                      onPressed: () {})
                ],
              ),
            ),
    );
  }

  Widget _buildCartPriceText({required String label, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(price),
      ],
    );
  }
}
