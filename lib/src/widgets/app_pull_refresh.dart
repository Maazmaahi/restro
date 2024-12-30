part of 'widgets.dart';

class AppPullRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;

  const AppPullRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color = AppColors.red,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: onRefresh,
      showChildOpacityTransition: false,
      color: color,
      backgroundColor: backgroundColor,
      height: 87,
      springAnimationDurationInMilliseconds: 600,
      animSpeedFactor: 1.2,
      child: child,
    );
  }
}