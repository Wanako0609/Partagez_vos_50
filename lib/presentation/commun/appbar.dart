import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/auth/authentication.dart';
import 'package:provider/provider.dart';
import '../../data/models/AppUser.dart';
import 'constants.dart';

final AuthenticationService _auth = AuthenticationService();

const toolbarHeight = 70.0;
Container shape = Container(
  decoration: const BoxDecoration(
    gradient: mAppBarGradient,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  ),
);

AppBar myAppBar({required BuildContext context, bool? homePath}) {
  Color colorUser = const Color.fromARGB(255, 255, 73, 73);

  final user = Provider.of<AppUser?>(context);

  bool connected;

  if (user == null) {
    connected = false;
  } else {
    connected = true;
  }

  return AppBar(
    toolbarHeight: toolbarHeight,
    title: TextButton(
      onPressed: homePath == null || false
          ? () => Navigator.pushNamed(context, '/')
          : () {},
      child: const Text(
        "Partagez vos 50",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontFamily: "logo", fontSize: 20),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    flexibleSpace: shape,
    leading: connected ? const _AccountConnect() : const _AccountNotConnect(),
    actions: [
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

AppBar myAppBarRetour(
    {required BuildContext context,
    PreferredSizeWidget? bottom = null,
    bool? profilPath}) {
  Color colorUser = const Color.fromARGB(255, 255, 73, 73);

  bool canRetour = false;
  if (Navigator.canPop(context)) {
    canRetour == true;
  }

  final user = Provider.of<AppUser?>(context);

  bool connected;

  if (user == null) {
    connected = false;
  } else {
    connected = true;
  }

  return AppBar(
    toolbarHeight: toolbarHeight,
    title: TextButton(
      onPressed: (() => Navigator.pushNamed(context, '/')),
      child: const Text(
        "Partagez vos 50",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontFamily: "logo", fontSize: 20),
      ),
    ),
    flexibleSpace: shape,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    leading: const GoBackButton(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {},
          tooltip: "My Bag",
          icon: const Icon(Icons.shopping_bag, color: mIconColor),
        ),
      ),
    ],
    bottom: bottom,
  );
}

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (() => Navigator.maybePop(context)),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: mIconColor,
        ));
  }
}

//account btn
class _AccountConnect extends StatelessWidget {
  const _AccountConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/userProfil');
      },
      tooltip: "Mon compte",
      icon: const Icon(
        Icons.person,
      ),
      color: Colors.white,
    );
  }
}

class _AccountNotConnect extends StatelessWidget {
  const _AccountNotConnect({Key? key}) : super(key: key);

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

//NOT USE
class _IconAccount extends StatelessWidget {
  const _IconAccount({
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

class _AccountMenu extends StatelessWidget {
  const _AccountMenu({
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
        color: Colors.white,
      ),
      onSelected: (value) {
        switch (value) {
          case 0:
            Navigator.pushNamed(context, '/userProfil');
            break;
          case 1:
            _auth.signOutUser();
            break;
          default:
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
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
        PopupMenuItem(
          value: 1,
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
