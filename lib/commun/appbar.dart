import 'package:flutter/material.dart';
import 'package:partagez_vos_50/services/authentication.dart';
import 'package:provider/provider.dart';
import '../models/AppUser.dart';
import 'constants.dart';
import '../main.dart';
import 'package:partagez_vos_50/login_activity/login.dart';

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
      onPressed: () {
        gotoHomePage(context);
      },
      child: const Text(
        "Partagez vos 50",
        textAlign: TextAlign.center,
        style:
            TextStyle(color: mPrimaryColor, fontFamily: "logo", fontSize: 20),
      ),
    ),
    centerTitle: true,
    leading: const Icon(Icons.menu, color: mIconColor),
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
        gotoLoginPage(context);
      },
      tooltip: "Mon compte",
      icon: const Icon(
        Icons.person,
      ),
      color: Colors.white,
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
        color: mPrimaryColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(Icons.account_box),
              Text(
                "Mon profil",
                style: TextStyle(color: mTextColor),
              )
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            _auth.signOutUser();
          },
          child: Row(
            children: const [
              Icon(Icons.logout),
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

void gotoHomePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MyMainPage();
      },
    ),
  );
}

void gotoLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MyLoginPage();
      },
    ),
  );
}
