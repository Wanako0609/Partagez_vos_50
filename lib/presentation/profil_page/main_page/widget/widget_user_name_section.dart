import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';
import '../../communWidget/error.dart';

class UserNameSectionWidget extends StatefulWidget {
  @override
  State<UserNameSectionWidget> createState() => _UserNameSectionWidgetState();
}

class _UserNameSectionWidgetState extends State<UserNameSectionWidget> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const UserError();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          color: mCardUserBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //line suivante
                InformationLine(user, user.nom.toString(), "Ton nom"),
                //line suivante
                InformationLine(user, user.prenom.toString(), "Ton prenom"),
                //line suivante
                InformationLine(user, user.numero.toString(), "Ton numero")
              ],
            ),
          ),
        ),
      );
    }
  }

  Padding InformationLine(AppUser? user, String text, String lineText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text("$lineText : ", style: mTextUserInformation),
          //test si la valeur existe en DB
          user == null
              ? const Text("Pas enregister", style: mTextUserInformationUser)
              : Text(text, style: mTextUserInformationUser),
        ],
      ),
    );
  }
}
