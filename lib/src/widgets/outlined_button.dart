part of 'widgets.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.primary),
        // backgroundColor: AppColors.red300,
        foregroundColor: AppColors.white,
        minimumSize: const Size(150, 40),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator(color: AppColors.white)
          : Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}