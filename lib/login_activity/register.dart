import 'package:flutter/material.dart';
import 'package:partagez_vos_50/commun/constants.dart';
import 'package:partagez_vos_50/main.dart';
import 'login.dart';
import 'package:partagez_vos_50/commun/appbar.dart';

class MyRegisterPage extends StatelessWidget {
  const MyRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: MyRegisterColumn(),
        ),
      ),
    );
  }
}

class MyRegisterColumn extends StatefulWidget {
  const MyRegisterColumn({Key? key}) : super(key: key);

  @override
  State<MyRegisterColumn> createState() => _MyRegisterColumnState();
}

class _MyRegisterColumnState extends State<MyRegisterColumn> {
  //variable
  final _emailReturn = TextEditingController();
  final _passwordReturn = TextEditingController();

  String email = "";
  String password = "";

  String? errorEmailMessage;
  String? errorPasswordMessage;
  String result = "";

  //fonction
  void voidfield(String email, String password) {
    setState(() {
      errorEmailMessage = null;
      errorPasswordMessage = null;
    });

    if (email.trim().isEmpty) {
      setState(() {
        errorEmailMessage = "Vous devez remplir le champs";
      });
    } else {
      if (email.length < 10) {
        setState(() {
          errorEmailMessage = "Vous devez avoir minimum 10 caracteres !";
        });
      } else {
        if (password.trim().isEmpty) {
          setState(() {
            errorPasswordMessage = "Vous devez remplir le champs";
          });
        } else {
          if (password.length < 6) {
            setState(() {
              errorPasswordMessage = "Vous devez avoir minimum 6 caracteres !";
            });
          } else {
            connexion(email, password);
          }
        }
      }
    }
  }

  void connexion(String email, String password) {
    String userEmail = "test";
    String userPassword = "test";
    if ((email == userEmail) & (password == userPassword)) {
      setState(() {
        result = "connexion reussi !";
        gotoHomePage();
      });
    } else {
      setState(() {
        result = "Mauvais Mot de passe ou mauvaise Email";
      });
    }
  }

  void gotoHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MyMainPage();
        },
      ),
    );
  }

  void gotoLoginrPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MyLoginPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Création de compte',
          style: TextStyle(fontSize: 40, color: mSecondColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Email", errorText: errorEmailMessage),
            controller: _emailReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Mot de passe", errorText: errorPasswordMessage),
            controller: _passwordReturn,
            obscureText: true,
          ),
        ),
        ElevatedButton(
          onPressed: (() {
            voidfield(_emailReturn.text, _passwordReturn.text);
          }),
          child: const Text("Connexion", style: TextStyle(fontSize: 15)),
        ),
        Text(
          result,
          style: const TextStyle(color: Colors.red),
        ),
        const Divider(
          thickness: 2,
        ),
        ElevatedButton(
          onPressed: () {
            gotoLoginrPage();
          },
          child: const Text('Deja un compte ?', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
