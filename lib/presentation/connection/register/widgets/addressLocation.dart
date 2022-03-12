import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextField(
            decoration: const InputDecoration(hintText: "Adresse"),
            controller: widget.rueReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: const InputDecoration(hintText: "Ville"),
            controller: widget.villeReturn,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: const InputDecoration(hintText: "Code Postal"),
            controller: widget.postalCodeReturn,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
