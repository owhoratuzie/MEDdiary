import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_diary/src/theme/colors/colors.dart';


/* -- Light & Dark Text Themes -- */
class TTextTheme {
  TTextTheme._(); //To avoid creating instances

  /* -- Light Text Theme -- */
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(fontSize: 28.0, fontWeight: FontWeight.bold, color: tDarkColor),
    displayMedium: GoogleFonts.outfit(fontSize: 24.0, fontWeight: FontWeight.w700, color: tDarkColor),
    displaySmall: GoogleFonts.outfit(fontSize: 24.0, fontWeight: FontWeight.normal, color: tDarkColor),
    headlineMedium: GoogleFonts.outfit(fontSize: 18.0, fontWeight: FontWeight.w600, color: tDarkColor),
    headlineSmall: GoogleFonts.outfit(fontSize: 18.0, fontWeight: FontWeight.normal, color: tDarkColor),
    titleLarge: GoogleFonts.outfit(fontSize: 14.0, fontWeight: FontWeight.w600, color: tDarkColor),
    bodyLarge: GoogleFonts.outfit(fontSize: 14.0, color: tDarkColor),
    bodyMedium: GoogleFonts.outfit(fontSize: 14.0, color: tDarkColor.withOpacity(0.8)),
  );

  /* -- Dark Text Theme -- */
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(fontSize: 28.0, fontWeight: FontWeight.bold, color: tWhiteColor),
    displayMedium: GoogleFonts.outfit(fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    displaySmall: GoogleFonts.outfit(fontSize: 24.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    headlineMedium: GoogleFonts.outfit(fontSize: 18.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    headlineSmall: GoogleFonts.outfit(fontSize: 18.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    titleLarge: GoogleFonts.outfit(fontSize: 14.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyLarge: GoogleFonts.outfit(fontSize: 14.0, color: tWhiteColor),
    bodyMedium: GoogleFonts.outfit(fontSize: 14.0, color: tWhiteColor.withOpacity(0.8)),
  );
}
