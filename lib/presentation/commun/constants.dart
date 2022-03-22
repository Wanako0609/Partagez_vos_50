import 'package:flutter/material.dart';

//basic
const mPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const mSecondColor = Color.fromARGB(255, 129, 0, 0);
const mTercierColor = Color(0xFFf38f6d);
const mErrorColor = Color.fromARGB(255, 158, 78, 58);
const mBackgroundColor = Color.fromARGB(255, 201, 201, 201);
const mAppBarBackgroundColor = Color.fromARGB(255, 189, 24, 24);

const mTextColor = Color.fromARGB(255, 0, 0, 0);
const mIconColor = Color.fromARGB(255, 0, 0, 0);

const mTextFieldBackgroundColor = Color.fromARGB(255, 185, 185, 185);
const mCardBackgroundColor = Color.fromARGB(255, 124, 124, 124);

//item colors
const mPriceColor = Color.fromARGB(255, 56, 56, 56);
const mTextMainPriceColor = mPrimaryColor;
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

//login colors
const mTextStepName = TextStyle(color: mTextColor);
const mTextVerifyItem = TextStyle(color: mTextColor, fontSize: 18);

//user profils
const mTextUserTitle = TextStyle(
  fontFamily: "logo",
  fontSize: 30,
  color: mSecondColor,
);
const mTextUserInformation =
    TextStyle(fontSize: 20, color: mTercierColor, fontWeight: FontWeight.bold);
const mTextUserInformationUser = TextStyle(fontSize: 20, color: Colors.white);

//design btn user profil
ElevatedButton mUserElevatedButton(String name, void Function() func) {
  return ElevatedButton(
    onPressed: func,
    child: Text(name),
    style: ElevatedButton.styleFrom(primary: const Color(0xFF641220)),
  );
}

ElevatedButton mUserElevatedButtonFuture(String name, void func) {
  return ElevatedButton(
    onPressed: (() => func),
    child: Text(name),
    style: ElevatedButton.styleFrom(primary: const Color(0xFF641220)),
  );
}

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
          Radius.circular(20),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: mPrimaryColor, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
