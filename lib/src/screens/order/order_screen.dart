import 'package:flutter/material.dart';
import 'package:restro/src/cores/cores.dart';

import '../../widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.back,
      title: translate?.myOrders ?? "My Orders",
      body: const Center(
        child: Text("OrderScreen"),
      ),
    );
  }
}
