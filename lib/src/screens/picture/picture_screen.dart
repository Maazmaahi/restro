import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:restro/src/cores/cores.dart';

import '../../widgets/widgets.dart';

class PictureScreen extends StatelessWidget {
  final String imagePath;

  const PictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      leftButton: CustomAppBarLeftButtons.back,
      title: "",
      body: PhotoView(
        backgroundDecoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
        ),
        imageProvider: imagePath.contains('http')
            ? NetworkImage(imagePath)
            : AssetImage(imagePath),
        // enableRotation: true,
        enablePanAlways: true,
        loadingBuilder: (context, event) {
          if (event == null) {
            return const Center(
              child: Text("Loading"),
            );
          }

          final value = event.cumulativeBytesLoaded /
              (event.expectedTotalBytes ??
                  event.cumulativeBytesLoaded);

          final percentage = (100 * value).floor();
          return Center(
            child: Text("$percentage%"),
          );
        },
        errorBuilder: (_, __, ___) {
          return const Center(child: Text("well, that went badly"));
        },
        // maxScale: PhotoViewComputedScale.contained * 2.0,
        minScale: PhotoViewComputedScale.contained * 0.8,
        initialScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
