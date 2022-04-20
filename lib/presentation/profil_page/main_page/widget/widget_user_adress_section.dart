import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';
import '../../../commun/constants.dart';
import '../../communWidget/error.dart';

class UserAddressSectionWidget extends StatefulWidget {
  const UserAddressSectionWidget({Key? key}) : super(key: key);

  @override
  State<UserAddressSectionWidget> createState() =>
      _UserAddressSectionWidgetState();
}

class _UserAddressSectionWidgetState extends State<UserAddressSectionWidget> {
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
                InformationLine(user, user.address!.rue.toString(), "Ta rue"),
                InformationLine(
                    user, user.address!.ville.toString(), "Ta ville"),
                InformationLine(user, user.address!.codePostal.toString(),
                    "Ton code postal"),
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
              ? const Text("Non renseigner", style: mTextUserInformationUser)
              : Text(text, style: mTextUserInformationUser),
        ],
      ),
    );
  }
}
