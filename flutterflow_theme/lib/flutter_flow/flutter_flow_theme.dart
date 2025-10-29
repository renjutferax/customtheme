// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color surface;
  late Color surfaceVariant;
  late Color onSurface;
  late Color outline;
  late Color onSecondary;
  late Color onTertiary;
  late Color primaryContainer;
  late Color onPrimaryContainer;
  late Color inverseSurface;
  late Color inverseOnSurface;
  late Color scrim;
  late Color shadow;
  late Color secondaryContainer;
  late Color onSecondaryContainer;
  late Color tertiaryContainer;
  late Color onTertiaryContainer;
  late Color errorContainer;
  late Color onErrorContainer;
  late Color onSurfaceVariant;
  late Color background;
  late Color onBackground;
  late Color onPrimary;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF14B8A6);
  late Color tertiary = const Color(0xFFFF7F50);
  late Color alternate = const Color(0xFFE5EAF2);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF4B5563);
  late Color primaryBackground = const Color(0xFFF8FAFC);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFFD8E1FF);
  late Color accent2 = const Color(0xFFCFF3EE);
  late Color accent3 = const Color(0xFFFFE1D6);
  late Color accent4 = const Color(0xFF6366F1);
  late Color success = const Color(0xFF10B981);
  late Color warning = const Color(0xFFFACC15);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFF2196F3);

  late Color surface = const Color(0xFFFFFFFF);
  late Color surfaceVariant = const Color(0xFFE0E3E7);
  late Color onSurface = const Color(0xFF000000);
  late Color outline = const Color(0xCDD1D5DB);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color onTertiary = const Color(0xFFFFFFFF);
  late Color primaryContainer = const Color(0xFFD8E1FF);
  late Color onPrimaryContainer = const Color(0xFF001A3A);
  late Color inverseSurface = const Color(0xFF1E1E2F);
  late Color inverseOnSurface = const Color(0xFFE2E8F0);
  late Color scrim = const Color(0x00000066);
  late Color shadow = const Color(0x34000000);
  late Color secondaryContainer = const Color(0xFFCFF3EE);
  late Color onSecondaryContainer = const Color(0xFF002D28);
  late Color tertiaryContainer = const Color(0xFFFFE1D6);
  late Color onTertiaryContainer = const Color(0xFF3A1300);
  late Color errorContainer = const Color(0xFFFDDCDC);
  late Color onErrorContainer = const Color(0xFF410001);
  late Color onSurfaceVariant = const Color(0xCB6B7280);
  late Color background = const Color(0xFFF4F6F8);
  late Color onBackground = const Color(0xFF0F172A);
  late Color onPrimary = const Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Inter Tight';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter Tight';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter Tight';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Inter Tight';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Inter Tight';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  String get bodyLargeFamily => 'Inter Tight';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyMediumFamily => 'Inter Tight';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodySmallFamily => 'Inter Tight';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.interTight(
        color: Color(0xFFE5E5E5),
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Inter Tight';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter Tight';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter Tight';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Inter Tight';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Inter Tight';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.interTight(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Inter Tight';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter Tight';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter Tight';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.interTight(
        color: Color(0xFFE5E5E5),
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Inter Tight';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter Tight';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter Tight';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.interTight(
        color: theme.onPrimary,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Inter Tight';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.interTight(
        color: theme.onPrimary,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Inter Tight';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.interTight(
        color: theme.onPrimary,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Inter Tight';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter Tight';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter Tight';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1D2428);
  late Color secondaryBackground = const Color(0xFF14181B);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xB2262D34);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color surface = const Color(0xFFF566ED);
  late Color surfaceVariant = const Color(0xFFFCFC9A);
  late Color onSurface = const Color(0xFF46C346);
  late Color outline = const Color(0xFF7FEC58);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color onTertiary = const Color(0xFFFFFFFF);
  late Color primaryContainer = const Color(0xFFE0DBFF);
  late Color onPrimaryContainer = const Color(0xFF14181B);
  late Color inverseSurface = const Color(0xFF14181B);
  late Color inverseOnSurface = const Color(0xFFFFFFFF);
  late Color scrim = const Color(0xFF808080);
  late Color shadow = const Color(0xFFCCCCCC);
  late Color secondaryContainer = const Color(0xFFD1F4EF);
  late Color onSecondaryContainer = const Color(0xFF14181B);
  late Color tertiaryContainer = const Color(0xFFFFD8C2);
  late Color onTertiaryContainer = const Color(0xFF14181B);
  late Color errorContainer = const Color(0xFFFFD6D6);
  late Color onErrorContainer = const Color(0xFF14181B);
  late Color onSurfaceVariant = const Color(0xFF6D6D6F);
  late Color background = const Color(0xFFF9F9F9);
  late Color onBackground = const Color(0xFF1C1C1E);
  late Color onPrimary = const Color(0xFF006C38);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
