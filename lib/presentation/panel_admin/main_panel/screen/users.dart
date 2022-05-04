import 'package:flutter/material.dart';

import '../viewmodels/vm_users/users_list.dart';
import '../viewmodels/vm_users/vm_users.dart';

class UsersAdmin extends StatelessWidget {
  const UsersAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ExpenseListUser(),
    );
  }
}
