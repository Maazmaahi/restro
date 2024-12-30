part of './core.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      surface: AppColors.lightBackGroundColor,
      primary: AppColors.primary,
      secondary: AppColors.steelBlue,
      tertiary: AppColors.lightTeal,
      inversePrimary: AppColors.primary.withOpacity(0.3),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      surface: AppColors.darkBackGroundColor,
      primary: AppColors.primary,
      secondary: AppColors.steelBlue,
      tertiary: AppColors.lightTeal,
      inversePrimary: AppColors.primary.withOpacity(0.3),
    ),
  );
}
