import 'package:flutter/material.dart';

class AppTheme {
  // Color scheme from website
  static const Color background = Color(0xFF181C20);
  static const Color cardBackground = Color(0xFF23272F);
  static const Color topBarBackground = Color(0xFF23272F);
  static const Color accent = Color(0xFFF26A21);
  static const Color accentForeground = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFFF3F4F6);
  static const Color mutedForeground = Color(0xFFA1A1AA);
  static const Color border = Color(0xFFEBEBEB);
  static const Color inputBackground = Color(0xFF2D323B);
  
  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        onPrimary: accentForeground,
        surface: cardBackground,
        onSurface: foreground,
        background: background,
        onBackground: foreground,
        secondary: mutedForeground,
        onSecondary: foreground,
        error: error,
        onError: accentForeground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: topBarBackground,
        foregroundColor: foreground,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: accentForeground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: foreground,
          side: const BorderSide(color: border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: cardBackground,
        selectedItemColor: accent,
        unselectedItemColor: mutedForeground,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1,
      ),
    );
  }

  // Gradient background
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [background, cardBackground],
    stops: [0.0, 1.0],
  );

  // Text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: foreground,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: foreground,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: foreground,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: foreground,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: foreground,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: mutedForeground,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: foreground,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: mutedForeground,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: mutedForeground,
  );
}
