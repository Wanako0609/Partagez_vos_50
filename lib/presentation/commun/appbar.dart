import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/auth/authentication.dart';
import 'package:provider/provider.dart';
import '../../data/models/AppUser.dart';
import '../profil_page/main_page/screen/userProfil.dart';
import 'constants.dart';
import '../../main.dart';
import 'package:partagez_vos_50/presentation/connection/login/screen/login.dart';

final AuthenticationService _auth = AuthenticationService();

AppBar myAppBar(BuildContext context) {
  Color colorUser = const Color.fromARGB(255, 255, 73, 73);

  final user = Provider.of<AppUser?>(context);

  bool connected;

  if (user == null) {
    connected = false;
  } else {
    connected = true;
  }

  return AppBar(
    title: TextButton(
      onPressed: (() => Navigator.pushNamed(context, '/')),
      child: const Text(
        "Partagez vos 50",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontFamily: "logo", fontSize: 20),
      ),
    ),
    centerTitle: true,
    leading: const Icon(Icons.drag_handle, color: mIconColor),
    actions: [
      connected ? const AccountMenu() : IconAccount(colorUser: colorUser),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {},
          tooltip: "My Bag",
          icon: const Icon(Icons.shopping_bag, color: mIconColor),
        ),
      ),
    ],
  );
}

class IconAccount extends StatelessWidget {
  const IconAccount({
    Key? key,
    required this.colorUser,
  }) : super(key: key);

  final Color colorUser;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      tooltip: "Mon compte",
      icon: const Icon(
        Icons.person,
      ),
      color: mIconColor,
    );
  }
}

class AccountMenu extends StatelessWidget {
  const AccountMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 50),
      color: mBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      tooltip: 'Parametre',
      child: const Icon(
        Icons.person,
        color: mTercierColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/userProfil'),
            child: Row(
              children: const [
                Icon(
                  Icons.account_box,
                  color: mIconColor,
                ),
                Text(
                  "Mon profil",
                  style: TextStyle(color: mTextColor),
                )
              ],
            ),
          ),
        ),
        PopupMenuItem(
          onTap: (() => _auth.signOutUser()),
          child: Row(
            children: const [
              Icon(
                Icons.logout,
                color: mIconColor,
              ),
              Text(
                "Deconnection",
                style: TextStyle(color: mTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
