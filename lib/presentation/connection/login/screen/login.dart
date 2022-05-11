import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:partagez_vos_50/presentation/connection/login/widgets/text_field.dart';
import 'package:time/time.dart';
import '../../../../data/bdd/auth/authentication.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';

import '../../../commun/button.dart';
import '../../../commun/customToast.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context),
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

  LinearGradient GradientSignInGoogle = const LinearGradient(
      colors: [Colors.blue, Color.fromARGB(255, 47, 84, 148)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

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
      Navigator.pushNamed(context, '/userProfil');
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
        const Text('Connexion', style: mTitle),
        TextFieldSection(
            errorEmailMessage: errorEmailMessage,
            errorPasswordMessage: errorPasswordMessage,
            emailReturn: emailReturn,
            passwordReturn: passwordReturn),
        mMyButton(
            texte: "CONNEXION",
            onpressed: () => voidfield(emailReturn.text, passwordReturn.text)),
        Text(
          result,
          style: const TextStyle(color: Colors.red),
        ),
        const Divider(thickness: 2),
        const SizedBox(height: 45),
        mMyButton(
          texte: "CONNEXION AVEC GOOGLE",
          onpressed: () => _auth.signInWithGoogle(context),
          gradient: GradientSignInGoogle,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pas de compte ?",
              style: mTextBasic,
            ),
            TextButton(
              onPressed: (() => Navigator.pushNamed(context, '/register')),
              child: const Text(
                "Cree son compte !",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
