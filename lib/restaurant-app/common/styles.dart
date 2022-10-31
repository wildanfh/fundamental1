import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xffF3F9FB);
const Color primaryTextColor = Color(0xff323232);
const Color secondaryColor = Color(0xff474F85);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.rubik(
    fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.rubik(
    fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.rubik(
    fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.rubik(
    fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.rubik(
    fontSize: 24, fontWeight: FontWeight.w500),
  headline6: GoogleFonts.rubik(
    fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.rubik(
    fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle2: GoogleFonts.rubik(
    fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.rubik(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.rubik(
    fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.rubik(
    fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.rubik(
    fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.rubik(
    fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);