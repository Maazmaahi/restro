part of '../cores.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      surface: AppColors.lightBackGroundColor,
      onSurface: AppColors.black,
      primary: AppColors.primary,
      onPrimary: AppColors.black,
      secondary: AppColors.steelBlue,
      tertiary: AppColors.lightTeal,
      shadow: AppColors.lightShadowColor,
      inversePrimary: AppColors.primary.withOpacity(0.3),
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 40,
        backgroundColor: AppColors.lightBackGroundColor,
      )
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      surface: AppColors.darkBackGroundColor,
      onSurface: AppColors.white,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.steelBlue,
      tertiary: AppColors.lightTeal,
      shadow: AppColors.darkShadowColor,
      inversePrimary: AppColors.primary.withOpacity(0.3),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 40,
      backgroundColor: AppColors.darkBackGroundColor,
    )
  );
}
