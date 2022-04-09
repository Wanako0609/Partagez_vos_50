import 'package:flutter/material.dart';

class ReturnProfilPage extends StatelessWidget {
  const ReturnProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, "/userProfil"),
        child: const Text("Retour"));
  }
}
