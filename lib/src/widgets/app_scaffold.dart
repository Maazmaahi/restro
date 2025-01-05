part of 'widgets.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final CustomAppBarLeftButtons leftButton;
  final List<Widget>? actions;

  const AppScaffold({
    super.key,
    this.body,
    this.title,
    this.actions,
    this.leftButton = CustomAppBarLeftButtons.none,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
