import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/data/models/Addresse.dart';
import 'package:partagez_vos_50/presentation/commun/customToast.dart';
import 'package:partagez_vos_50/presentation/profil_page/communWidget/error.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

import '../../../../data/models/AppUser.dart';
import '../widget/change_address_widget.dart';
import '../widget/change_name_widget.dart';

class ChangeAddressVm extends StatelessWidget {
  const ChangeAddressVm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const UserError();
    } else {
      //controlleur
      TextEditingController rue = TextEditingController();
      TextEditingController ville = TextEditingController();
      TextEditingController codePostal = TextEditingController();

      return Column(
        children: [
          ChangeAddressWidget(
            rueRetour: rue,
            villeRetour: ville,
            codePostalRetour: codePostal,
          ),
          ElevatedButton(
            onPressed: (() {
              changeAddress(rue, ville, codePostal, context, user);
            }),
            child: const Text("Modifier votre adresse"),
            style: ElevatedButton.styleFrom(primary: const Color(0xFF641220)),
          )
        ],
      );
    }
  }

  void changeAddress(
      TextEditingController rue,
      TextEditingController ville,
      TextEditingController codePostal,
      BuildContext context,
      AppUser user) async {
    if (rue.text.trim().isEmpty ||
        ville.text.trim().isEmpty ||
        codePostal.text.trim().isEmpty) {
      errorToast(context, "Tous les champs doivent etre rempli");
    } else if (rue.text.length < 3 ||
        ville.text.length < 3 ||
        codePostal.text.length < 3) {
      errorToast(context, "Vous devez avoir minimum 3 caractere");
    } else {
      successToast(context, "Modification reussit",
          "Vous avez bien modifiez votre adresse");
      Address address = Address(
          rue: rue.text, codePostal: codePostal.text, ville: ville.text);
      await DatabaseUsers(uid: user.uid).saveAddress(address);
      FocusScope.of(context).unfocus();
      await 2.seconds.delay;
      Navigator.pushNamed(context, '/userProfil');
    }
  }
}
