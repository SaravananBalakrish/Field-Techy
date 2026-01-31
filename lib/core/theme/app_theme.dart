import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0B4F4A);
  static const Color startColor = Color(0xFF00776F);
  static const Color secondaryColor = Color(0xFF009966);
  static const Color lightGreen = Color(0xFFD1FAE5);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color(0xFF111827);
  static const Color subTitleColor = Color(0xFF6B7280);
  static const Color borderColor = Color(0xFFD1D5DB);

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: textColor,
      surface: Colors.white,
      onSurface: textColor,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme).copyWith(
      headlineMedium: GoogleFonts.lato(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
        headlineSmall: GoogleFonts.lato(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      bodyMedium: GoogleFonts.lato(
        color: textColor,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.lato(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      )
    ),
    /*appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 2,
      surfaceTintColor: backgroundColor,
    ),*/
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondaryColor,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: GoogleFonts.poppins(
        color: subTitleColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: primaryColor,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    dividerColor: Colors.grey.shade600,
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade600,
      thickness: 0.5,
      endIndent: 16,
      indent: 16,
      space: 5
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8, vertical: 10)),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return lightGreen;
            }
            return null;
          },
        ),
        foregroundColor: WidgetStateProperty.all(textColor),
        side: WidgetStateProperty.resolveWith<BorderSide?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(color: Colors.transparent);
            }
            return const BorderSide(color: borderColor);
          },
        ),
      ),
    ),
    useMaterial3: true,
  );
}
