import 'package:flutter/material.dart';

// ─── Palette ────────────────────────────────────────────────────────────────
class KColors {
  // Brand
  static const Color primary   = Color(0xFF2D6A8F); // bleu profond
  static const Color secondary = Color(0xFF00C9A7); // cyan-vert vif
  static const Color accent    = Color(0xFF7C5CBF); // violet doux

  // Neutrals
  static const Color dark      = Color(0xFF1A1F36); // quasi-noir
  static const Color grey      = Color(0xFF8A94A6); // gris texte
  static const Color greyLight = Color(0xFFF0F4F8); // fond gris très clair
  static const Color white     = Color(0xFFFFFFFF);

  // States
  static const Color success   = Color(0xFF2DCE89);
  static const Color warning   = Color(0xFFFFB84C);
  static const Color error     = Color(0xFFFF4D6D);
  static const Color info      = Color(0xFF5B8DEF);

  // Legacy aliases (pour ne pas casser les fichiers non encore migrés)
  static const Color tertiary  = Color(0xFF2D6A8F);
  static const Color Purple    = Color(0xFF7C5CBF);
  static const Color beige     = Color(0xFFF0F4F8);
}

// ─── Typography ─────────────────────────────────────────────────────────────
class KTypography {
  static TextStyle h1(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.w800,
            color: color ?? KColors.dark,
            letterSpacing: -0.5,
          );

  static TextStyle h2(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: color ?? KColors.dark,
            letterSpacing: -0.3,
          );

  static TextStyle h3(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
            color: color ?? KColors.dark,
          );

  static TextStyle h4(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: color ?? KColors.dark,
            fontSize: 16,
          );

  static TextStyle h5(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: color ?? KColors.dark,
            fontSize: 14,
          );

  static TextStyle h6(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: color ?? KColors.grey,
            fontSize: 13,
          );

  static TextStyle caption(BuildContext context, {Color? color}) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: color ?? KColors.grey,
            fontSize: 11,
          );
}

// ─── App Theme ───────────────────────────────────────────────────────────────
ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: KColors.primary,
      primary: KColors.primary,
      secondary: KColors.secondary,
      surface: KColors.white,
      onPrimary: KColors.white,
      onSecondary: KColors.white,
    ),
    scaffoldBackgroundColor: KColors.greyLight,
    fontFamily: 'Poppins',

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: KColors.white,
      foregroundColor: KColors.dark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 17,
        color: KColors.dark,
        letterSpacing: -0.2,
      ),
      iconTheme: IconThemeData(color: KColors.dark),
    ),

    // NavigationBar (bottom)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: KColors.white,
      indicatorColor: KColors.primary.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 11,
            color: KColors.primary,
          );
        }
        return const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 11,
          color: KColors.grey,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: KColors.primary, size: 22);
        }
        return const IconThemeData(color: KColors.grey, size: 22);
      }),
      elevation: 8,
      shadowColor: Colors.black12,
    ),

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primary,
        foregroundColor: KColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    ),

    // InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE4E9F0), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE4E9F0), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: KColors.primary, width: 2),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        color: KColors.grey,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Poppins',
        color: KColors.grey,
        fontSize: 14,
      ),
    ),

    // Card
    cardTheme: CardTheme(
      color: KColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE4E9F0), width: 1),
      ),
      margin: EdgeInsets.zero,
    ),

    // Chip
    chipTheme: ChipThemeData(
      backgroundColor: KColors.greyLight,
      selectedColor: KColors.primary.withOpacity(0.15),
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE4E9F0),
      space: 1,
      thickness: 1,
    ),
  );
}

// ─── Gradient helpers ────────────────────────────────────────────────────────
class KGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1E4D6B), Color(0xFF2D6A8F), Color(0xFF00C9A7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF2D6A8F), Color(0xFF1A3F57)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF00C9A7), Color(0xFF2DCE89)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF7C5CBF), Color(0xFF5B8DEF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ─── Shadow helpers ───────────────────────────────────────────────────────────
class KShadows {
  static List<BoxShadow> soft = [
    BoxShadow(
      color: const Color(0xFF1A1F36).withOpacity(0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> medium = [
    BoxShadow(
      color: const Color(0xFF1A1F36).withOpacity(0.10),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> primary = [
    BoxShadow(
      color: KColors.primary.withOpacity(0.30),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}
