import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class WidgetAddVet extends StatelessWidget {
  const WidgetAddVet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: IconButton(
              iconSize: 80,
              icon: const Icon(
                Icons.add_a_photo_outlined,
                size: 80,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/addVet');
              },
            ),
          ),
          const Text(
            "Ajouter un vetement",
            style: TextStyle(color: mTextColor, fontSize: 20),
          )
        ],
      ),
    );
  }
}
