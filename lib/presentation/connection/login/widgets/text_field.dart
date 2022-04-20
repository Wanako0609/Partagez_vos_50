import 'package:flutter/material.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection(
      {required this.errorEmailMessage,
      required this.errorPasswordMessage,
      required this.emailReturn,
      required this.passwordReturn});

  final String? errorEmailMessage;
  final String? errorPasswordMessage;
  final TextEditingController emailReturn;
  final TextEditingController passwordReturn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
              decoration: InputDecoration(
                  labelText: "Email", errorText: errorEmailMessage),
              controller: emailReturn,
              keyboardType: TextInputType.emailAddress),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Mot de passe", errorText: errorPasswordMessage),
            controller: passwordReturn,
            obscureText: true,
          ),
        ),
      ],
    );
  }
}
