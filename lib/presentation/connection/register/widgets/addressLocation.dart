import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/connection/register/screen/registerPage.dart';

import '../../../commun/constants.dart';

class AddressFormWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddressFormWidget(
      {required this.rueReturn,
      required this.postalCodeReturn,
      required this.villeReturn,
      required this.prenomReturn,
      required this.nomReturn});

  final TextEditingController rueReturn;
  final TextEditingController postalCodeReturn;
  final TextEditingController villeReturn;
  final TextEditingController prenomReturn;
  final TextEditingController nomReturn;

  @override
  State<AddressFormWidget> createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends State<AddressFormWidget> {
  //variable

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Vos informations',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35, color: mSecondColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Nom"),
                  controller: nomReturn,
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Prenom"),
                  controller: prenomReturn,
                  keyboardType: TextInputType.name,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            decoration: const InputDecoration(labelText: "Adresse"),
            controller: widget.rueReturn,
            keyboardType: TextInputType.streetAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: const InputDecoration(labelText: "Ville"),
            controller: widget.villeReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: const InputDecoration(labelText: "Code Postal"),
            controller: widget.postalCodeReturn,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
