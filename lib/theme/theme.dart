import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final lightTheme = ThemeData(
  fontFamily: "KantumruyPro",
  brightness: Brightness.light,
  primaryColor: Colors.amber,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[100],
  canvasColor: Colors.white,
  textTheme: TextTheme(
    displaySmall: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black, fontSize: 16),
    displayLarge: TextStyle(color: Colors.black),
    titleLarge: TextStyle(color: Colors.black),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleSpacing: 10,
    elevation: 0,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Colors.black),
      foregroundColor: WidgetStateProperty.all(Colors.grey),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.amber, size: 17),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.cyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      enabledMouseCursor: MouseCursor.uncontrolled,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  primarySwatch: Colors.blue,
  fontFamily: "KantumruyPro",
  scaffoldBackgroundColor: HexColor('#383b39'),
  canvasColor: Colors.black.withAlpha(150),
  textTheme: TextTheme(
    displaySmall: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white, fontSize: 16),
    displayLarge: TextStyle(color: Colors.white),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black54,
    titleSpacing: 10,
    elevation: 0,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
  ),
  iconTheme: IconThemeData(color: Colors.white, size: 17),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      elevation: 0,
      enabledMouseCursor: MouseCursor.uncontrolled,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
