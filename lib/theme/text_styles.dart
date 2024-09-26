import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle titleLarge = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleMedium = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleSmall = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headlinaLarde = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headlineMedium = TextStyle(
    fontFamily: Fonts.ReadexPro.name,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static TextStyle headlineSmall = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyLarge = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static TextStyle bodyMedium = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static TextStyle bodySmall = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static TextStyle labelMedium = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelSmall = TextStyle(
    fontFamily: Fonts.Poppins.name,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle matbu = TextStyle(
    fontFamily: Fonts.Hanzala.name,
    fontSize: 40,
    fontWeight: FontWeight.w300,
  );
  static TextStyle rikaHarfler = TextStyle(
    fontFamily: Fonts.BUTTON.name,
    fontSize: 40,
    fontWeight: FontWeight.w300,
  );
  static TextStyle rikaKelimeler = TextStyle(
    fontFamily: Fonts.BUTTON.name,
    fontSize: 30,
    fontWeight: FontWeight.w300,
  );
}

enum Fonts { Poppins, ReadexPro, BUTTON, Hanzala }
