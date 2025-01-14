part of 'widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final CustomAppBarLeftButtons leftButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? bottom;

  const AppScaffold({
    super.key,
    this.body,
    this.title,
    this.actions,
    this.backgroundColor,
    this.bottom,
    this.leftButton = CustomAppBarLeftButtons.none,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leftButton: leftButton,
            title: title??"",
            color: Theme.of(context).colorScheme.surface,
            isSpacer: actions != null,
            actions: actions,
          ),
        ),
        body: body,
        bottomNavigationBar: bottom,
      ),
    );
  }
}
