import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static const mainColor = MaterialColor(
    0xFF7eb4a2,
    <int, Color>{
      50: Color(0xFF4fc9c2),
      100: Color(0xFF42a59f),
      200: Color(0xFF42a59f),
      300: Color(0xFF42a59f),
      400: Color(0xFF42a59f),
      500: Color(0xFF42a59f),
      600: Color(0xFF42a59f),
      700: Color(0xFF42a59f),
      800: Color(0xFF42a59f),
      900: Color(0xFF42a59f),
    },
  );

  static const backgroundColor = MaterialColor(
    0xFF0b6e4f,
    <int, Color>{
      50: Color(0xFF0b6e4f),
      100: Color(0xFF0b6e4f),
      200: Color(0xFF0b6e4f),
      300: Color(0xFF0b6e4f),
      400: Color(0xFF0b6e4f),
      500: Color(0xFF0b6e4f),
      600: Color(0xFF0b6e4f),
      700: Color(0xFF0b6e4f),
      800: Color(0xFF0b6e4f),
      900: Color(0xFF0b6e4f),
    },
  );

  static const buttonBackground = MaterialColor(
    0xFF64400e,
    <int, Color>{
      50: Color(0xFF55360a),
      100: Color(0xFF64400e),
      200: Color(0xFF64400e),
      300: Color(0xFF64400e),
      400: Color(0xFF64400e),
      500: Color(0xFF64400e),
      600: Color(0xFF64400e),
      700: Color(0xFF64400e),
      800: Color(0xFF64400e),
      900: Color(0xFF64400e),
    },
  );

  static const textColor = Colors.white;

  static ThemeData getTheme() {
    return ThemeData(
      // brightness: Brightness.dark,
      primaryColor: mainColor,
      primarySwatch: mainColor,
      cardColor: buttonBackground,
      secondaryHeaderColor: Colors.white70,
      dividerColor: Colors.black,
      colorScheme: ThemeData().colorScheme.copyWith(
          primary: mainColor,
          secondary: backgroundColor,
          inversePrimary: buttonBackground.shade50,
          tertiary: mainColor.shade50),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(GoogleFonts.mulish(
            fontSize: 16,
            height: 1,
          )),
          backgroundColor: MaterialStateProperty.all<Color>(buttonBackground),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: buttonBackground.shade50, width: 4),
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.roboto(color: textColor),
        bodyMedium: GoogleFonts.roboto(color: textColor),
        bodyLarge: GoogleFonts.roboto(color: textColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
