import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:partagez_vos_50/data/bdd/auth/authentication.dart';
import 'package:partagez_vos_50/presentation/all_item/screen/item.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/commun/constants.dart';
import 'presentation/connection/login/screen/login.dart';
import 'presentation/connection/register/screen/registerPage.dart';
import 'presentation/main/screen/mainPage.dart';
import 'presentation/commun/appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDHtS3Amn_vdx6Jx0GaS-zGpSuSu0Qvqgg",
          appId: "1:628622489345:web:d7eb9635e17af5abc60d00",
          messagingSenderId: "628622489345",
          projectId: "partagez-vos-50"),
    );
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        title: 'Partagez vos 50',
        theme: MyTheme().theme1,
        home: const MyMainPage(),
      ),
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

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return const MyMainPage();
          },
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) {
            return const MyLoginPage();
          },
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) {
            return const RegisterPage();
          },
        );

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: const Text("Error"), centerTitle: true),
                body: const Center(
                  child: Text("Page not found"),
                )));
    }
  }
}
