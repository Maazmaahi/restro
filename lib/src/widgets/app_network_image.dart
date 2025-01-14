part of 'widgets.dart';

class AppNetworkImage extends StatelessWidget {
  final String imagePath;
  final double radius;
  final Color? color;

  const AppNetworkImage({
    super.key,
    required this.imagePath,
    this.radius = 0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutesName.picture, extra: imagePath);
      },
      child: CachedNetworkImage(
        imageUrl: imagePath,
        errorWidget: (context, url, error) => const SizedBox(),
        imageBuilder: (context, assetProvider) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: assetProvider,
              color: color,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
