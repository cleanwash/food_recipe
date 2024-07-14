import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle titleTextBold = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 50, 
    fontWeight: FontWeight.bold,
    height: 75/50,
  );

 static TextStyle headerTextBod = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 30, 
    fontWeight: FontWeight.bold, 
    height: 45/30
  );

static TextStyle largeTextBold = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    height: 30/20
  );

static TextStyle mediumTextBold = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 18, 
    fontWeight: FontWeight.bold, 
    height: 27/18
  );

  static TextStyle normalTextBold= TextStyle(
     fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 16, 
    fontWeight: FontWeight.bold, 
    height: 24/16
  );

  static TextStyle smallTextBold= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 14, 
    fontWeight: FontWeight.bold, 
    height: 21/14
  );

 static TextStyle smallerTextBold= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 11, 
    fontWeight: FontWeight.bold, 
    height: 17/11
  );
////////////////////////////////////////////////////////////////////
 static TextStyle titleTextRegular= TextStyle(
   fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 50, 
    fontWeight: FontWeight.normal, 
    height:75/50

  );

 static TextStyle headerTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 30, 
    fontWeight: FontWeight.normal, 
    height: 45/30
  );
  
static TextStyle largeTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 20, 
    fontWeight: FontWeight.normal,
    height: 30/20
  );

static TextStyle mediumTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 18, 
    fontWeight: FontWeight.normal, 
    height: 27/18
  );

  static TextStyle normalTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 16, 
    fontWeight: FontWeight.normal, 
    height: 24/16
  );

  static TextStyle smallTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 14, 
    fontWeight: FontWeight.normal, 
    height: 21/14
  );

  static TextStyle smallerTextRegular= TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 11, 
    fontWeight: FontWeight.normal, 
    height: 17/11
  );
}