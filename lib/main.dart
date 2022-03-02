import 'package:flutter/material.dart';

import 'constants.dart';
import 'homeSection/mainColumn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Partagez vos 50',
      theme: MyTheme().theme1,
      home: const MyMainPage(),
    );
  }
}

class MyMainPage extends StatelessWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: MyMainColumn(),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text(
        "Partagez vos 50",
        style: TextStyle(color: mPrimaryColor, fontFamily: "logo"),
      ),
      centerTitle: true,
      leading: const Icon(Icons.menu, color: mIconColor),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: "Search",
          icon: const Icon(Icons.search, color: mIconColor),
        ),
        IconButton(
          onPressed: () {},
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
}
