import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/AppUser.dart';
import 'button.dart';

class AdminButtonWidget extends StatelessWidget {
  const AdminButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return Container(
        height: 5,
        color: Colors.red,
      );
    } else {
      if (user.isAdmin == true) {
        return const ButtonUserPage(
          icon: Icons.personal_injury_outlined,
          text: "Panel Administrateur",
          page: "/userProfil/panelAdmin",
        );
      } else {
        return Container();
      }
    }
  }
}
