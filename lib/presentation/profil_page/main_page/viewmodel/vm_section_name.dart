import 'package:flutter/material.dart';

import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/profil_page/main_page/widget/widget_user_name_section.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';
import '../../../commun/constants.dart';
import '../../communWidget/error.dart';

class UserNameSection extends StatefulWidget {
  @override
  State<UserNameSection> createState() => _UserNameSectionState();
}

class _UserNameSectionState extends State<UserNameSection> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const UserError();
    } else {
      return StreamProvider<AppUser?>.value(
        value: DatabaseUsers(uid: user.uid).userData,
        initialData: null,
        child: Column(
          children: [
            UserNameSectionWidget(),
            mUserElevatedButton("Modifier mes informations",
                () => Navigator.pushNamed(context, '/userProfil/changeName')),
          ],
        ),
      );
    }
  }
}
