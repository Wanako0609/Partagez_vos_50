import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/bdd/firestore/database_user.dart';
import '../../../../data/models/appuser.dart';
import '../widget/btn_admin_widget.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return Container();
    } else {
      return StreamProvider<AppUser?>.value(
          value: DatabaseUsers(uid: user.uid).userData,
          initialData: null,
          child: const AdminButtonWidget());
    }
  }
}
