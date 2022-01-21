import 'package:flutter/material.dart';
import 'package:friends_secrets/app/core/shared/res/colors/colors_themes.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: GoogleFonts.rajdhani(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: ColorsThemes.primary,
        ),
        headline2: GoogleFonts.rajdhani(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        headline3: GoogleFonts.rajdhani(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headline4: GoogleFonts.rajdhani(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headline5: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headline6: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: GoogleFonts.rajdhani(
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: GoogleFonts.rajdhani(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        bodyText2: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        caption: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        button: GoogleFonts.rajdhani(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        overline: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      colorScheme: const ColorScheme(
        primary: ColorsThemes.primary,
        primaryVariant: ColorsThemes.primary,
        secondary: ColorsThemes.primary,
        secondaryVariant: ColorsThemes.primary,
        surface: ColorsThemes.primary,
        background: ColorsThemes.primary,
        error: ColorsThemes.primary,
        onPrimary: ColorsThemes.primary,
        onSecondary: ColorsThemes.primary,
        onSurface: ColorsThemes.primary,
        onBackground: ColorsThemes.primary,
        onError: ColorsThemes.primary,
        brightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: ColorsThemes.primary,
        size: 20,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        headline1: GoogleFonts.rajdhani(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: ColorsThemes.primary,
        ),
        headline2: GoogleFonts.rajdhani(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        headline3: GoogleFonts.rajdhani(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headline4: GoogleFonts.rajdhani(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headline5: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headline6: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: GoogleFonts.rajdhani(
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        subtitle2: GoogleFonts.rajdhani(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        bodyText2: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        caption: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        button: GoogleFonts.rajdhani(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        overline: GoogleFonts.rajdhani(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      colorScheme: const ColorScheme(
        primary: ColorsThemes.primary,
        primaryVariant: ColorsThemes.primary,
        secondary: ColorsThemes.primary,
        secondaryVariant: ColorsThemes.primary,
        surface: ColorsThemes.primary,
        background: ColorsThemes.primary,
        error: ColorsThemes.primary,
        onPrimary: ColorsThemes.primary,
        onSecondary: ColorsThemes.primary,
        onSurface: ColorsThemes.primary,
        onBackground: ColorsThemes.primary,
        onError: ColorsThemes.primary,
        brightness: Brightness.dark,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        height: 56,
        colorScheme: ColorScheme(
          primary: ColorsThemes.primary,
          primaryVariant: ColorsThemes.primary,
          secondary: ColorsThemes.primary,
          secondaryVariant: ColorsThemes.primary,
          surface: ColorsThemes.primary,
          background: ColorsThemes.primary,
          error: ColorsThemes.primary,
          onPrimary: ColorsThemes.primary,
          onSecondary: ColorsThemes.primary,
          onSurface: ColorsThemes.primary,
          onBackground: ColorsThemes.primary,
          onError: ColorsThemes.primary,
          brightness: Brightness.dark,
        ),
      ),
      iconTheme: const IconThemeData(
        size: 20,
      ),
    );
  }
}
