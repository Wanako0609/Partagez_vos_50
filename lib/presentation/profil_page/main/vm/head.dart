import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/bdd/auth/authentication.dart';
import '../../../../data/bdd/firestore/database_user.dart';
import '../../../../data/models/AppUser.dart';
import '../../../commun/error_connexion.dart';
import '../widget/button.dart';
import '../widget/header/image_profil.dart';
import '../widget/header/information.dart';
import 'btn_admin.dart';

class HeaderUsers extends StatelessWidget {
  const HeaderUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const UserError();
    } else {
      return StreamProvider<AppUser?>.value(
          value: DatabaseUsers(uid: user.uid).userData,
          initialData: null,
          child: _HeaderUsers());
    }
  }
}

class _HeaderUsers extends StatelessWidget {
  _HeaderUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _auth =
        AuthenticationService(); // TODO a retire
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const ImageProfilPage(),
          const InformationUsers(),
          const SizedBox(height: 15),
          const ButtonUserPage(
            icon: Icons.person_outline,
            text: "Profil",
            page: "/userProfil/profil",
          ),
          const SizedBox(height: 15),
          const ButtonUserPage(
              icon: Icons.person_pin_circle_outlined,
              text: "Adresse",
              page: "/userProfil/address"),
          const SizedBox(height: 15),
          const ButtonUserPage(
              icon: Icons.settings,
              text: "Parametre",
              page: "/userProfil/parametre"),
          const SizedBox(height: 15),
          const ButtonUserPage(
              icon: Icons.person_add_disabled_outlined,
              text: "Deconnexion",
              page: "/userProfil/deconnexion"),
          const SizedBox(height: 15),
          const AdminButton(),
          TextButton(
              onPressed: (() {
                _auth.signOutUser();
              }),
              child: const Text("deconnexion")),
        ],
      ),
    );
  }
}
