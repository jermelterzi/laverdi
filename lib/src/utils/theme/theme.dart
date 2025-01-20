import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff516527),
      surfaceTint: Color(0xff516527),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd3ec9e),
      onPrimaryContainer: Color(0xff141f00),
      secondary: Color(0xff5a6148),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdee6c5),
      onSecondaryContainer: Color(0xff171e09),
      tertiary: Color(0xff396660),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbcece4),
      onTertiaryContainer: Color(0xff00201d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff1a1c15),
      onSurfaceVariant: Color(0xff45483c),
      outline: Color(0xff76786b),
      outlineVariant: Color(0xffc6c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3129),
      inversePrimary: Color(0xffb8d084),
      primaryFixed: Color(0xffd3ec9e),
      onPrimaryFixed: Color(0xff141f00),
      primaryFixedDim: Color(0xffb8d084),
      onPrimaryFixedVariant: Color(0xff3a4d10),
      secondaryFixed: Color(0xffdee6c5),
      onSecondaryFixed: Color(0xff171e09),
      secondaryFixedDim: Color(0xffc2caaa),
      onSecondaryFixedVariant: Color(0xff424a31),
      tertiaryFixed: Color(0xffbcece4),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xffa0d0c8),
      onTertiaryFixedVariant: Color(0xff204e48),
      surfaceDim: Color(0xffdadbcf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e8),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe9e9dd),
      surfaceContainerHighest: Color(0xffe3e3d7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff36490c),
      surfaceTint: Color(0xff516527),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff677c3b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3e462e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff70785c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1b4a45),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4f7d76),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff1a1c15),
      onSurfaceVariant: Color(0xff414439),
      outline: Color(0xff5e6054),
      outlineVariant: Color(0xff797c6f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3129),
      inversePrimary: Color(0xffb8d084),
      primaryFixed: Color(0xff677c3b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4f6324),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff70785c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff575f45),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4f7d76),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff36645e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdadbcf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e8),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe9e9dd),
      surfaceContainerHighest: Color(0xffe3e3d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1a2600),
      surfaceTint: Color(0xff516527),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff36490c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1e2510),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3e462e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002824),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1b4a45),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff22251b),
      outline: Color(0xff414439),
      outlineVariant: Color(0xff414439),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3129),
      inversePrimary: Color(0xffddf6a7),
      primaryFixed: Color(0xff36490c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff223200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3e462e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff282f19),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1b4a45),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00332e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdadbcf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e8),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe9e9dd),
      surfaceContainerHighest: Color(0xffe3e3d7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb8d084),
      surfaceTint: Color(0xffb8d084),
      onPrimary: Color(0xff253600),
      primaryContainer: Color(0xff3a4d10),
      onPrimaryContainer: Color(0xffd3ec9e),
      secondary: Color(0xffc2caaa),
      onSecondary: Color(0xff2c331d),
      secondaryContainer: Color(0xff424a31),
      onSecondaryContainer: Color(0xffdee6c5),
      tertiary: Color(0xffa0d0c8),
      onTertiary: Color(0xff013732),
      tertiaryContainer: Color(0xff204e48),
      onTertiaryContainer: Color(0xffbcece4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140d),
      onSurface: Color(0xffe3e3d7),
      onSurfaceVariant: Color(0xffc6c8b9),
      outline: Color(0xff909284),
      outlineVariant: Color(0xff45483c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d7),
      inversePrimary: Color(0xff516527),
      primaryFixed: Color(0xffd3ec9e),
      onPrimaryFixed: Color(0xff141f00),
      primaryFixedDim: Color(0xffb8d084),
      onPrimaryFixedVariant: Color(0xff3a4d10),
      secondaryFixed: Color(0xffdee6c5),
      onSecondaryFixed: Color(0xff171e09),
      secondaryFixedDim: Color(0xffc2caaa),
      onSecondaryFixedVariant: Color(0xff424a31),
      tertiaryFixed: Color(0xffbcece4),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xffa0d0c8),
      onTertiaryFixedVariant: Color(0xff204e48),
      surfaceDim: Color(0xff12140d),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f08),
      surfaceContainerLow: Color(0xff1a1c15),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff34362e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbcd488),
      surfaceTint: Color(0xffb8d084),
      onPrimary: Color(0xff101900),
      primaryContainer: Color(0xff829954),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc6ceaf),
      onSecondary: Color(0xff121805),
      secondaryContainer: Color(0xff8c9477),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa5d4cc),
      onTertiary: Color(0xff001a17),
      tertiaryContainer: Color(0xff6b9992),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff12140d),
      onSurface: Color(0xfffbfbef),
      onSurfaceVariant: Color(0xffcaccbd),
      outline: Color(0xffa2a496),
      outlineVariant: Color(0xff828477),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d7),
      inversePrimary: Color(0xff3b4e11),
      primaryFixed: Color(0xffd3ec9e),
      onPrimaryFixed: Color(0xff0c1400),
      primaryFixedDim: Color(0xffb8d084),
      onPrimaryFixedVariant: Color(0xff2a3c01),
      secondaryFixed: Color(0xffdee6c5),
      onSecondaryFixed: Color(0xff0d1303),
      secondaryFixedDim: Color(0xffc2caaa),
      onSecondaryFixedVariant: Color(0xff323922),
      tertiaryFixed: Color(0xffbcece4),
      onTertiaryFixed: Color(0xff001512),
      tertiaryFixedDim: Color(0xffa0d0c8),
      onTertiaryFixedVariant: Color(0xff0a3d38),
      surfaceDim: Color(0xff12140d),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f08),
      surfaceContainerLow: Color(0xff1a1c15),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff34362e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff6ffda),
      surfaceTint: Color(0xffb8d084),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbcd488),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff6ffdd),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc6ceaf),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffebfffa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa5d4cc),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff12140d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffafcec),
      outline: Color(0xffcaccbd),
      outlineVariant: Color(0xffcaccbd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d7),
      inversePrimary: Color(0xff202f00),
      primaryFixed: Color(0xffd8f0a2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbcd488),
      onPrimaryFixedVariant: Color(0xff101900),
      secondaryFixed: Color(0xffe2ebc9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc6ceaf),
      onSecondaryFixedVariant: Color(0xff121805),
      tertiaryFixed: Color(0xffc0f0e8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa5d4cc),
      onTertiaryFixedVariant: Color(0xff001a17),
      surfaceDim: Color(0xff12140d),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f08),
      surfaceContainerLow: Color(0xff1a1c15),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff34362e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
