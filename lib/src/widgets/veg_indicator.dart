part of 'widgets.dart';

class VegIndicator extends StatelessWidget {
  final bool isVeg;

  const VegIndicator({super.key, this.isVeg = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          // color: AppColors.red,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isVeg ? AppColors.green : AppColors.red)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isVeg ? AppColors.green : AppColors.red,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
