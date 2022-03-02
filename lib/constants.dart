import 'package:flutter/material.dart';

const mPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const mBackgroundColor = Color.fromARGB(255, 34, 34, 34);
const mAppBarBackgroundColor = Color(0xFF000000);

const mTextColor = Color(0xFFFFFFFF);
const mIconColor = Color(0xFFFFFFFF);

class MyTheme {
  final theme1 = ThemeData(
    primaryColor: mPrimaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: mAppBarBackgroundColor,
    ),
    scaffoldBackgroundColor: mBackgroundColor,
    fontFamily: "body",
  );
}
