import 'package:flutter/material.dart';

const mPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const mSecondColor = Color.fromARGB(255, 129, 0, 0);
const mErrorColor = Color.fromARGB(255, 252, 150, 150);
const mBackgroundColor = Color.fromARGB(255, 34, 34, 34);
const mAppBarBackgroundColor = Color(0xFF000000);

const mTextColor = Color(0xFFFFFFFF);
const mIconColor = Color(0xFFFFFFFF);

const mTextFieldBackgroundColor = Color.fromARGB(255, 126, 126, 126);

const mPriceColor = Color.fromARGB(255, 56, 56, 56);
const mTextMainPriceColor = Color.fromARGB(255, 255, 0, 0);

const mTextTitleProduit = TextStyle(
    color: Color(0xFFFFFFFF),
    fontFamily: "logo",
    fontWeight: FontWeight.bold,
    fontSize: 20);

const mTextDescriptionProduit =
    TextStyle(color: Color.fromARGB(255, 201, 201, 201), fontSize: 15);

const mTextPriceProduit = TextStyle(
    color: mPrimaryColor,
    fontFamily: "logo",
    fontWeight: FontWeight.bold,
    fontSize: 20);

class MyTheme {
  final theme1 = ThemeData(
    splashColor: mPrimaryColor,
    primaryColor: mPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: mPrimaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: mAppBarBackgroundColor,
    ),
    scaffoldBackgroundColor: mBackgroundColor,
    fontFamily: "body",
    //text field theme
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(color: mErrorColor),
      hoverColor: mPrimaryColor,
      focusColor: mPrimaryColor,
      counterStyle: TextStyle(color: mTextColor),
      hintStyle: TextStyle(color: mTextColor),
      fillColor: mTextFieldBackgroundColor,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mErrorColor, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mPrimaryColor, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    ),
    //btn theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: mSecondColor),
    ),
  );
}
