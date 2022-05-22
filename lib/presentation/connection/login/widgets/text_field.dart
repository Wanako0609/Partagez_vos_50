import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/text_field.dart';

class TextFieldSection extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
          child: mTextField(
              title: "Ton Email",
              controller: emailReturn,
              errorText: errorEmailMessage,
              inputType: TextInputType.emailAddress),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: mTextField(
              title: "Mot de Passe",
              controller: passwordReturn,
              errorText: errorPasswordMessage,
              obsucureText: true),
        ),
      ],
    );
  }
}
