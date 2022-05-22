import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class VerifyPage extends StatefulWidget {
  final String email;
  final String password = "*****";
  final String adresse;
  final String codePostal;
  final String ville;
  final String nom;
  final String prenom;

  // ignore: use_key_in_widget_constructors
  const VerifyPage(
      {required this.email,
      required this.adresse,
      required this.codePostal,
      required this.ville,
      required this.nom,
      required this.prenom});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Email : ${widget.email}", style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Mot de passe : ${widget.password}",
                style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Adresse : ${widget.adresse}", style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Code Postal : ${widget.codePostal}",
                style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Ville : ${widget.ville}", style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Nom : ${widget.nom}", style: mTextVerifyItem),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Prenom : ${widget.prenom}", style: mTextVerifyItem),
          ),
        ],
      ),
    );
  }
}
