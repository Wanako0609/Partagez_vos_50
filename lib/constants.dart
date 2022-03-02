import 'package:flutter/material.dart';
import 'main.dart';
import 'package:partagez_vos_50/login_activity/login.dart';

const mPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const mSecondColor = Color.fromARGB(255, 129, 0, 0);
const mErrorColor = Color.fromARGB(255, 252, 150, 150);
const mBackgroundColor = Color.fromARGB(255, 34, 34, 34);
const mAppBarBackgroundColor = Color(0xFF000000);

const mTextColor = Color(0xFFFFFFFF);
const mIconColor = Color(0xFFFFFFFF);

const mTextFieldBackgroundColor = Color.fromARGB(255, 126, 126, 126);

class MyTheme {
  final theme1 = ThemeData(
    splashColor: mPrimaryColor,
    primaryColor: mPrimaryColor,
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

AppBar myAppBar(BuildContext context) {
  return AppBar(
    title: TextButton(
      onPressed: () {
        gotoHomePage(context);
      },
      child: const Text(
        "Partagez vos 50",
        style:
            TextStyle(color: mPrimaryColor, fontFamily: "logo", fontSize: 20),
      ),
    ),
    centerTitle: true,
    leading: const Icon(Icons.menu, color: mIconColor),
    actions: [
      IconButton(
        onPressed: () {
          gotoLoginPage(context);
        },
        tooltip: "User account",
        icon: const Icon(
          Icons.account_circle,
        ),
        color: mPrimaryColor,
      ),
      IconButton(
        onPressed: () {},
        tooltip: "My Bag",
        icon: const Icon(Icons.shopping_bag, color: mIconColor),
      ),
    ],
  );
}

void gotoHomePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MyMainPage();
      },
    ),
  );
}

void gotoLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MyLoginPage();
      },
    ),
  );
}
