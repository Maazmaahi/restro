part of 'widgets.dart';

class AppNetworkImage extends StatelessWidget {
  final String imagePath;
  final double radius;

  const AppNetworkImage({
    super.key,
    required this.imagePath,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      errorWidget: (context, url, error) => const SizedBox(),
      imageBuilder: (context, assetProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: assetProvider,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}