import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/commun/customToast.dart';
import 'package:partagez_vos_50/presentation/profil_page/communWidget/error.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

import '../../../../data/models/AppUser.dart';
import '../widget/change_name_widget.dart';

class ChangeNameVm extends StatelessWidget {
  const ChangeNameVm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const UserError();
    } else {
      //controlleur
      TextEditingController nom = TextEditingController();
      TextEditingController prenom = TextEditingController();

      return Column(
        children: [
          ChangeNameWidget(
            nomRetour: nom,
            prenomRetour: prenom,
          ),
          ElevatedButton(
            onPressed: (() {
              changeName(nom, prenom, context, user);
            }),
            child: const Text("Modifier vos parametre"),
            style: ElevatedButton.styleFrom(primary: const Color(0xFF641220)),
          )
        ],
      );
    }
  }

  void changeName(TextEditingController nom, TextEditingController prenom,
      BuildContext context, AppUser user) async {
    if (nom.text.trim().isEmpty || prenom.text.trim().isEmpty) {
      errorToast(context, "Tous les champs doivent etre rempli");
    } else if (nom.text.length < 3 || prenom.text.length < 3) {
      errorToast(context, "Vous devez avoir minimum 3 caractere");
    } else {
      successToast(context, "Modification reussit",
          "Vous avez bien modifiez vos information");
      await DatabaseUsers(uid: user.uid).saveNom(nom.text, prenom.text);
      FocusScope.of(context).unfocus();
      await 2.seconds.delay;
      Navigator.pushNamed(context, '/userProfil');
    }
  }
}
