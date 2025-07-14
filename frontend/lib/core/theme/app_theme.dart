import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFF7622);
  static const secondary = Color(0xFF1E1E2E);
  static const background = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF181C2E);
  static const textLight = Color(0xFFFFFFFF);
  static const error = Color(0xFFE53935);
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: Colors.white,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,
          error: AppColors.error,
          onError: Colors.white,
          background: AppColors.background,
          onBackground: AppColors.textDark,
          surface: Colors.white,
          onSurface: AppColors.textDark,
        ),
        textTheme: _textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.textDark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.textLight),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      );
}

const _textTheme = TextTheme(
  headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark),
  headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
  titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textDark),
  bodyLarge: TextStyle(fontSize: 16, color: AppColors.textDark),
  bodyMedium: TextStyle(fontSize: 14, color: AppColors.textLight),
);
