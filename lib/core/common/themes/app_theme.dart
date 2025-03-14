import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xff0D85E7),
      onPrimary: Colors.white,
      secondary: Color(0xffF6F5F8),
      onSecondary: Color(0xff8B8B8B),
      shadow: Color(0xff8B8B8B),
      surface: Colors.white,
      onSurface: Color(0xff090A0D),
      surfaceTint: Colors.transparent,
      error: Colors.red.shade400,
      onError: Colors.white,
      tertiary: Color(0xffF0F3FF),
      inversePrimary: Color(0xffF2F3F4),
    ),
    textTheme: textTheme,
  );

  static TextTheme textTheme = TextTheme(
    titleLarge:
        GoogleFonts.poppins(fontSize: 32.sp, fontWeight: FontWeight.w600),
    titleMedium:
        GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w600),
    titleSmall:
        GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
    bodyLarge:
        GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500),
    bodyMedium:
        GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400),
    bodySmall:
        GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400),
  );
}
