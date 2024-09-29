import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static TextStyle primaryTextStyle = GoogleFonts.montserrat();

  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.black),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.blue),
          // backgroundColor: WidgetStateProperty.all(Colors.red),
          foregroundColor: WidgetStateProperty.all(Colors.black),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      // fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w400).fontFamily,
      // fontFamily: 'Montserrat',
      textTheme: GoogleFonts.montserratTextTheme().apply().copyWith(
            bodyMedium: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            bodyLarge: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            bodySmall: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
      useMaterial3: true,
    );
  }
}
