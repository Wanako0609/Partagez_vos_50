import 'package:flutter/material.dart';

import '../../../commun/constants.dart';

class AccountWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AccountWidget(
      {required this.emailReturn, required this.passwordReturn});

  final TextEditingController passwordReturn;
  final TextEditingController emailReturn;

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  //variable

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
            print("tout est bon");
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Création de compte',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35, color: mSecondColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Email", errorText: errorEmailMessage),
            controller: widget.emailReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Mot de passe", errorText: errorPasswordMessage),
            controller: widget.passwordReturn,
            obscureText: true,
          ),
        ),
      ],
    );
  }
}
