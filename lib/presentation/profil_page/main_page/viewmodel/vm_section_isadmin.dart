import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/bdd/firestore/users_collec/database_user.dart';
import '../../../../data/models/AppUser.dart';
import '../widget/widget_user_isadmin_section.dart';

class IsAdminSectionVm extends StatefulWidget {
  const IsAdminSectionVm({Key? key}) : super(key: key);

  @override
  State<IsAdminSectionVm> createState() => _IsAdminSectionVmState();
}

class _IsAdminSectionVmState extends State<IsAdminSectionVm> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return Container();
    } else {
      return StreamProvider<AppUser?>.value(
          value: DatabaseUsers(uid: user.uid).userData,
          initialData: null,
          child: const UserIsAdminWidget());
    }
  }
}
