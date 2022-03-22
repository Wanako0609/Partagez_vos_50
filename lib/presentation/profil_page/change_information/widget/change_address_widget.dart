import 'package:flutter/material.dart';

class ChangeAddressWidget extends StatefulWidget {
  final TextEditingController rueRetour;
  final TextEditingController villeRetour;
  final TextEditingController codePostalRetour;

  const ChangeAddressWidget(
      {Key? key,
      required this.rueRetour,
      required this.villeRetour,
      required this.codePostalRetour})
      : super(key: key);

  @override
  State<ChangeAddressWidget> createState() => _ChangeAddressWidgetState();
}

class _ChangeAddressWidgetState extends State<ChangeAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Rue"),
            controller: widget.rueRetour,
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Ville"),
            controller: widget.villeRetour,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Code Postal"),
            controller: widget.codePostalRetour,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
