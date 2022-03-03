import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '../main.dart';
import 'package:partagez_vos_50/login_activity/login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
        tooltip: "Mon compte",
        icon: const Icon(
          Icons.account_circle,
        ),
        color: mPrimaryColor,
      ),
      IconButton(
        onPressed: () {
          _auth.signOut();
        },
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
