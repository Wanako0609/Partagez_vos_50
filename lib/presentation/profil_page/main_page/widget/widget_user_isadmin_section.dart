import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';

class UserIsAdminWidget extends StatefulWidget {
  const UserIsAdminWidget({Key? key}) : super(key: key);

  @override
  State<UserIsAdminWidget> createState() => _UserIsAdminWidgetState();
}

class _UserIsAdminWidgetState extends State<UserIsAdminWidget> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return Container();
    } else {
      if (user.isAdmin == true) {
        return ElevatedButton(
          onPressed: (() =>
              Navigator.pushNamed(context, '/userProfil/panelAdmin')),
          child: const Text(
            "Panel Administrateur",
            style: TextStyle(fontSize: 20),
          ),
        );
      } else {
        return Container();
      }
    }
  }
}
