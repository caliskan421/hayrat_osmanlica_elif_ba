import 'package:flutter/material.dart';

import 'text_styles.dart';

class AppColors {
  static const Color primary = Color(0xff0069E8);
  static const Color primaryContainer = Color(0xffE0EDFC);
  static const Color background = Color(0xffFFFFFF);
  static const Color secondary = Color(0xffF54238);
  static const Color secondaryContainer = Color(0xffFEE8E7);
  static const Color tertiary = Color(0xffCA35B4);
  static const Color tertiaryContainer = Color(0xffF9E7F6);
  static const Color fourth = Color(0xff06BB00);
  static const Color fourthContainer = Color(0xffE1F7E0);
  static const Color fifth = Color(0xffFF9500);
  static const Color fifthContainer = Color(0xffFFF2E0);
  static const Color sixth = Color(0xff00B9CE);
  static const Color sixthContainer = Color(0xffE0F7F9);
  static const Color surface = Color(0xffF4F4F4);
  static const Color surfaceBright = Color(0xffF9F9F9);
  static const Color onSurface = Color(0xff000000);
  static const Color outline = Color(0xffB9B9B9);
  static const Color outlineVariant = Color(0xffF0F0F0);

  static const Map<String, Color> colorMap = {
    'primary': primary,
    'primaryContainer': primaryContainer,
    'background': background,
    'secondary': secondary,
    'secondaryContainer': secondaryContainer,
    'tertiary': tertiary,
    'tertiaryContainer': tertiaryContainer,
    'fourth': fourth,
    'fourthContainer': fourthContainer,
    'fifth': fifth,
    'fifthContainer': fifthContainer,
    'sixth': sixth,
    'sixthContainer': sixthContainer,
    'surface': surface,
    'surfaceBright': surfaceBright,
    'onSurface': onSurface,
    'outline': outline,
    'outlineVariant': outlineVariant,
  };
}

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.primaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.secondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.tertiaryContainer,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceBright: AppColors.surfaceBright,
      scrim: AppColors.background,
      error: Colors.red,
      onError: Colors.redAccent,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant),
  textTheme: TextTheme(
    titleLarge: TextStyles.titleLarge,
    titleMedium: TextStyles.titleMedium,
    titleSmall: TextStyles.titleSmall,
    headlineLarge: TextStyles.headlinaLarde,
    headlineMedium: TextStyles.headlineMedium,
    headlineSmall: TextStyles.headlineSmall,
    bodyLarge: TextStyles.bodyLarge,
    bodyMedium: TextStyles.bodyMedium,
    bodySmall: TextStyles.bodySmall,
    labelMedium: TextStyles.labelMedium,
    labelSmall: TextStyles.labelSmall,
  ),
);
