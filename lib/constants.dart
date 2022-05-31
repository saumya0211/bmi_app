import 'package:flutter/material.dart';

const Color KActivecardcolor = Color(0xFF1D1F33);
const Color KInactivecardcolor = Color(0xFF111428);
const Color KBottomconatinercolor = Color(0xFFEB1555);
const Color KThumbcolor = Color(0xFFEB1555);
const Color KOverlaycolor = Color(0x29EB1555);
const Color KInactivetextcolor = Color(0xFF868792);
const Color KActivetextcolor = Colors.white;

final ThemeData KAppTheme = ThemeData.dark().copyWith(
primaryColor: const Color(0xFF0A0D22),
scaffoldBackgroundColor: const Color(0xFF0A0D22),
);

final TextStyle KNormalStyle = TextStyle(color: KActivetextcolor,fontWeight: FontWeight.w600 );
final TextStyle KBigStyle = TextStyle(color: KActivetextcolor,fontWeight: FontWeight.w900,fontSize: 80);
final TextStyle KBottomButtonTextStyle = TextStyle(color:KActivetextcolor,fontWeight:FontWeight.w700,fontSize: 25 );

final AppBar KAppBarStyle = AppBar(
  title: Center(child: Text('BMI APP')),
  backgroundColor: Color(0xFF1A1C30),
);