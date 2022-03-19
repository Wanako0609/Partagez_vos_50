import 'package:flutter/material.dart';

const mPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const mSecondColor = Color.fromARGB(255, 129, 0, 0);
const mErrorColor = Color.fromARGB(255, 252, 150, 150);
const mBackgroundColor = Color(0xFF222222);
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

const mTextStepName = TextStyle(color: mTextColor);
const mTextVerifyItem = TextStyle(color: mTextColor, fontSize: 18);

const mTextUserTitle = TextStyle(
  fontFamily: "logo",
  fontSize: 30,
  color: mSecondColor,
);
const mTextUserInformation = TextStyle(
    fontSize: 20, color: Color(0xFF660708), fontWeight: FontWeight.bold);
const mTextUserInformationUser = TextStyle(fontSize: 20, color: Colors.white);
const mCardBackgroundColor = Color(0xFF222323);

class MyTheme {
  final theme1 = ThemeData(
    splashColor: mPrimaryColor,
    primaryColor: mPrimaryColor,
    canvasColor: mBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: mPrimaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: mAppBarBackgroundColor,
    ),
    //scaffold background
    scaffoldBackgroundColor: mBackgroundColor,
    //font family
    fontFamily: "body",
    //text field theme
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: mTextColor),
      floatingLabelStyle: TextStyle(color: mTextColor, fontSize: 20),
      errorStyle: TextStyle(color: mErrorColor),
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
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: mSecondColor),
    ),
    cardColor: mCardBackgroundColor,
  );
}
