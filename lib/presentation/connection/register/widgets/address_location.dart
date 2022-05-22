import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/connection/register/screen/register_page.dart';
import 'package:partagez_vos_50/presentation/commun/text_field.dart';

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
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: mTextField(title: "Ton Nom", controller: nomReturn),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: mTextField(
                  title: "Ton Prenom",
                  controller: prenomReturn,
                  inputType: TextInputType.name),
            )
          ],
        ),
        const SizedBox(height: 20),
        mTextField(
            title: "Adresse",
            controller: widget.rueReturn,
            inputType: TextInputType.streetAddress),
        const SizedBox(height: 20),
        mTextField(title: "Ville", controller: widget.villeReturn),
        const SizedBox(height: 20),
        mTextField(
            title: "Code Postal",
            controller: widget.postalCodeReturn,
            inputType: TextInputType.number),
        const SizedBox(height: 20)
      ],
    );
  }
}
