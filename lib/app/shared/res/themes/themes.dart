import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/res/colors/colors_themes.dart';
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
        primaryVariant: ColorsThemes.primaryVariant,
        secondary: ColorsThemes.secondary,
        secondaryVariant: ColorsThemes.secondaryVariant,
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xffb00020),
        onPrimary: ColorsThemes.primary,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        height: 56,
        colorScheme: ColorScheme(
          primary: ColorsThemes.primary,
          primaryVariant: ColorsThemes.primaryVariant,
          secondary: ColorsThemes.secondary,
          secondaryVariant: ColorsThemes.secondaryVariant,
          surface: Colors.white,
          background: Colors.white,
          error: Color(0xffb00020),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedTextStyle: GoogleFonts.rajdhani(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
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
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        bodyText2: GoogleFonts.rajdhani(
          fontSize: 12,
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
        primaryVariant: ColorsThemes.primaryVariant,
        secondary: ColorsThemes.secondary,
        secondaryVariant: ColorsThemes.secondaryVariant,
        surface: Colors.white,
        background: Colors.white,
        error: Color(0xffb00020),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: ColorsThemes.primary,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        height: 56,
        colorScheme: ColorScheme(
          primary: ColorsThemes.primary,
          primaryVariant: ColorsThemes.primaryVariant,
          secondary: ColorsThemes.secondary,
          secondaryVariant: ColorsThemes.secondaryVariant,
          surface: Colors.white,
          background: Colors.white,
          error: Color(0xffb00020),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedTextStyle: GoogleFonts.rajdhani(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
