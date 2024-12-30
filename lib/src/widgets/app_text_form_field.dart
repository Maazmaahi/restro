part of 'widgets.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final FocusNode? ownFocus;
  final FocusNode? nextFocus;
  final bool readOnly;
  final bool enabled;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.ownFocus,
    this.nextFocus,
    this.maxLength,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      focusNode: ownFocus,
      onFieldSubmitted: (_) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}