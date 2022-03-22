import 'package:flutter/material.dart';

class ChangeNameWidget extends StatefulWidget {
  final TextEditingController nomRetour;
  final TextEditingController prenomRetour;

  const ChangeNameWidget(
      {Key? key, required this.nomRetour, required this.prenomRetour})
      : super(key: key);

  @override
  State<ChangeNameWidget> createState() => _ChangeNameWidgetState();
}

class _ChangeNameWidgetState extends State<ChangeNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Nom"),
            controller: widget.nomRetour,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Prenom"),
            controller: widget.prenomRetour,
            keyboardType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
