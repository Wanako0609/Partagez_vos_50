import 'package:flutter/material.dart';

import 'commun/constants.dart';
import 'main_activity/mainColumn.dart';
import 'commun/appbar.dart';

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
      appBar: myAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: MyMainColumn(),
        ),
      ),
    );
  }
}
