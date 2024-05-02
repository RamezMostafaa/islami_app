import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = Color(0xff242424);
  static Color primaryLightColor = Color(0xffB7935F);
  static Color primaryDarkColor = Color(0xff141A2E);
  static Color yellowDarkColor = Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryLightColor,
        selectedItemColor: blackColor,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: blackColor,
            fontFamily: "ElMessiri-SemiBold"),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: blackColor,
            fontFamily: "ElMessiri-SemiBold"),
        titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: blackColor,
            fontFamily: "ElMessiri-SemiBold"),
      ));
  static ThemeData darkMode = ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryLightColor,
        selectedItemColor: yellowDarkColor,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "ElMessiri-SemiBold"),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: "ElMessiri-SemiBold"),
        titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: yellowDarkColor,
            fontFamily: "ElMessiri-SemiBold"),
      ));
}
