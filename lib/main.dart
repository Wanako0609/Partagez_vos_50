import 'package:flutter/material.dart';

import 'constants.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF000000),
          ),
          backgroundColor: const Color.fromARGB(255, 34, 34, 34)),
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
      body: Container(color: mbackgroundColor),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("Partagez vos 50"),
      leading: const Icon(Icons.menu),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: "Search",
          icon: const Icon(
            Icons.search,
          ),
        ),
        IconButton(
          onPressed: () {},
          tooltip: "User account",
          icon: const Icon(
            Icons.account_circle,
          ),
          color: Colors.red,
        ),
        IconButton(
          onPressed: () {},
          tooltip: "My Bag",
          icon: const Icon(Icons.shopping_bag),
        ),
      ],
    );
  }
}
