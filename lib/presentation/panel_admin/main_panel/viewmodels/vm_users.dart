import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/AppUser.dart';
import '../widget/users/user_list.dart';

class ExpenseListUser extends StatelessWidget {
  const ExpenseListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AppUser?>>.value(
      value: DatabaseUsers(uid: "no-uid").usersData,
      initialData: const [],
      child: const UserListWidget(),
    );
  }
}
