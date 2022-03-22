import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/bdd/firestore/users_collec/database_user.dart';
import '../../../../data/models/AppUser.dart';
import '../../../commun/constants.dart';
import '../../communWidget/error.dart';
import '../widget/widget_user_adress_section.dart';

class UserAddressSectionVM extends StatefulWidget {
  @override
  State<UserAddressSectionVM> createState() => _UserAddressSectionVMState();
}

class _UserAddressSectionVMState extends State<UserAddressSectionVM> {
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
            const UserAddressSectionWidget(),
            mUserElevatedButton("Modifier mon adresse",
                () => Navigator.pushNamed(context, '/userProfil/changeAddress'))
          ],
        ),
      );
    }
  }
}
