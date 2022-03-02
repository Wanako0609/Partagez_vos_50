import 'package:flutter/material.dart';
import 'package:partagez_vos_50/constants.dart';
import 'package:partagez_vos_50/main.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: MyLoginColumn(),
        ),
      ),
    );
  }
}

class MyLoginColumn extends StatefulWidget {
  const MyLoginColumn({Key? key}) : super(key: key);

  @override
  State<MyLoginColumn> createState() => _MyLoginColumnState();
}

class _MyLoginColumnState extends State<MyLoginColumn> {
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
      if (email.length < 3) {
        setState(() {
          errorEmailMessage = "Vous devez avoir minimum 3 caracteres !";
        });
      } else if (email.length > 40) {
        setState(() {
          errorEmailMessage = "Vous devez avoir moins de 40 caracteres !";
        });
      } else {
        if (password.trim().isEmpty) {
          setState(() {
            errorPasswordMessage = "Vous devez remplir le champs";
          });
        } else {
          if (password.length < 3) {
            setState(() {
              errorPasswordMessage = "Vous devez avoir minimum 3 caracteres !";
            });
          } else if (password.length > 40) {
            setState(() {
              errorPasswordMessage =
                  "Vous devez avoir moins de 40 caracteres !";
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Connexion',
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
          onPressed: () {},
          child:
              const Text('Se crée un compte !', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
