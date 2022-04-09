import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:time/time.dart';
import '../../../../data/bdd/auth/authentication.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';

import '../../../commun/customToast.dart';

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
  //cree l'instance de la BD
  final AuthenticationService _auth = AuthenticationService();

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
            connexion(email.trim(), password.trim());
          }
        }
      }
    }
  }

  void connexion(String email, String password) async {
    dynamic resultconnection =
        await _auth.signInUserWithEmailAndPassword(email, password);

    if (resultconnection == 'user-not-found') {
      setState(() {
        result = "Aucun utilisateur trouvé";
      });
    } else if (resultconnection == 'wrong-password') {
      setState(() {
        result = "Mauvais mot de passe";
      });
    } else if (resultconnection is AppUser) {
      print("Connection reussit");
      await 1.seconds.delay;
      Navigator.pushNamed(context, '/');
      successToast(context, "", "Connecté avec \n $email");
      FocusScope.of(context).unfocus();
    } else {
      setState(() {
        result = "Ce n'est pas une adresse mail valide";
      });
    }
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
                  labelText: "Email", errorText: errorEmailMessage),
              controller: _emailReturn,
              keyboardType: TextInputType.emailAddress),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Mot de passe", errorText: errorPasswordMessage),
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
            Navigator.pushNamed(context, '/register');
          },
          child:
              const Text('Se crée un compte !', style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
