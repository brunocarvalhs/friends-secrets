import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/res/colors/colors_themes.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorsThemes.primary,
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 96,
          wordSpacing: -0.5,
        ),
        headline2: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 60,
          wordSpacing: -1.5,
        ),
        headline3: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 48.0,
          wordSpacing: 0.0,
        ),
        headline4: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 34.0,
          wordSpacing: 0.25,
          color: ColorsThemes.primary,
        ),
        headline5: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 24.0,
          wordSpacing: 0.0,
        ),
        headline6: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          wordSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          wordSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          wordSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          wordSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          wordSpacing: 0.25,
        ),
        button: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          wordSpacing: 0.75,
        ),
        caption: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          wordSpacing: 0.4,
        ),
        overline: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 10.0,
          wordSpacing: 1.5,
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorsThemes.primary,
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 96,
          wordSpacing: -0.5,
        ),
        headline2: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 60,
          wordSpacing: -1.5,
        ),
        headline3: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 48.0,
          wordSpacing: 0.0,
        ),
        headline4: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 34.0,
          wordSpacing: 0.25,
          color: ColorsThemes.primary,
        ),
        headline5: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 24.0,
          wordSpacing: 0.0,
        ),
        headline6: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          wordSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          wordSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          wordSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          wordSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          wordSpacing: 0.25,
        ),
        button: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          wordSpacing: 0.75,
        ),
        caption: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          wordSpacing: 0.4,
        ),
        overline: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 10.0,
          wordSpacing: 1.5,
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
    );
  }
}
