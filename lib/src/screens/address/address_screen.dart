import 'package:flutter/material.dart';
import 'package:restro/src/cores/cores.dart';

import '../../widgets/widgets.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.back,
      title: translate?.address ?? "Address",
      body: const Center(
        child: Text("AddressScreen"),
      ),
    );
  }
}
