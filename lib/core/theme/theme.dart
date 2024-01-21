import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_sport_app/core/utils/colorsApp/app_Colors.dart';
import 'package:news_sport_app/core/utils/font/font_style.dart';

final appTheme = ThemeData(
  //---------------------appBarTheme-----------------------
  appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Appcolors.backGroundColor),
  //------------------------text Theme----------------------
  textTheme: TextTheme(
    displayLarge: getlargefont(color: Colors.white),
    displaySmall: getsmallfont(color: Colors.white),
    displayMedium: getmeduimfont(color: Colors.white),
    bodySmall: getsmallfont(),
    headlineLarge: getlargefont(),
  ),
  scaffoldBackgroundColor: Colors.black,

  //----------------------The inputDecorations of Dark Mode --------------------
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[800],
    filled: true,
    prefixIconColor: Appcolors.lemonadaColor,
    hintStyle: getnormalfont(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.greyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.greyColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);
