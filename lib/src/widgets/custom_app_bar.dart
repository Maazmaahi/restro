part of 'widgets.dart';

enum CustomAppBarLeftButtons {
  back,
  cross,
  menu,
  hamburger,
  appLogo,
  none,
}

enum CustomAppBarRightButtons {
  storeLocator,
  wishlist,
  cart,
  notification,
  share,
  none,
}

class CustomAppBar extends StatelessWidget {
  final CustomAppBarLeftButtons leftButton;
  final String? title;
  final Color? color;
  final bool isShowDivider;
  final bool isSpacer;
  final Widget? bottom;
  final Widget? bottomOptional;
  final double bottomOpacity;
  final bool visibleAppBar;
  final List<Widget>? actions;
  final List<CustomAppBarRightButtons>? rightButtons;

  const CustomAppBar({
    super.key,
    this.leftButton = CustomAppBarLeftButtons.none,
    this.title,
    this.color = Colors.white,
    this.actions,
    this.rightButtons,
    this.isShowDivider = false,
    this.isSpacer = false,
    this.bottom,
    this.bottomOptional,
    this.visibleAppBar = true,
    this.bottomOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  _buildLeftIconButton(context),
                  const SizedBox(width: 4),
                  Text(
                    title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.primary,
                    ),
                  ),
                  if (isSpacer) const Spacer(),
                  ...?actions
                ],
              ),
            ),
          ),
          Container(
            height: 0.3,
            color: color,
          ),
          if (bottomOptional != null)
            Container(
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[bottomOptional ?? const SizedBox()],
              ),
            ),
          if (bottom != null)
            Container(
              height: 50,
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[bottom ?? const SizedBox()],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeftIconButton(context) {
    switch (leftButton) {
      case CustomAppBarLeftButtons.appLogo:
        return IconButton(
          icon: Image.asset(Assets.images.biryaniMahalLogo),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        );
      case CustomAppBarLeftButtons.back:
        return IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
      case CustomAppBarLeftButtons.cross:
        return IconButton(
          icon: Icon(
            Icons.cancel,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
      case CustomAppBarLeftButtons.menu:
      case CustomAppBarLeftButtons.hamburger:
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColors.primary,
          ),
          onPressed: () {
            // Scaffold.of(context).openDrawer();
          },
        );
      default:
        return Container(
          margin: const EdgeInsets.only(left: 20),
        );
    }
  }
}