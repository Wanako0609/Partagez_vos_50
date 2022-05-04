import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:partagez_vos_50/presentation/commun/sign_in_button.dart';
import 'package:partagez_vos_50/presentation/connection/login/widgets/text_field.dart';
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
  final emailReturn = TextEditingController();
  final passwordReturn = TextEditingController();

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
      await 400.milliseconds.delay;
      Navigator.pushNamed(context, '/');
      successToast(context, "Connexion", "Connecté avec \n $email");
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
        TextFieldSection(
            errorEmailMessage: errorEmailMessage,
            errorPasswordMessage: errorPasswordMessage,
            emailReturn: emailReturn,
            passwordReturn: passwordReturn),
        ElevatedButton(
          onPressed: (() {
            voidfield(emailReturn.text, passwordReturn.text);
          }),
          child: const Text("Connexion", style: TextStyle(fontSize: 15)),
        ),
        Text(
          result,
          style: const TextStyle(color: Colors.red),
        ),
        myGoogleSignInButton(context),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: mTextFieldBackgroundColor),
              onPressed: (() => Navigator.pushNamed(context, '/register')),
              child: const Text(
                "Se cree un compte !",
                style:
                    TextStyle(color: mSecondColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
