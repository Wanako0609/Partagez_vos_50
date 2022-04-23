import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/screen/stats.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/screen/users.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/viewmodels/vm_ajout_vet.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';
import '../../../commun/constants.dart';

class PanelAdmin extends StatefulWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  State<PanelAdmin> createState() => _PanelAdminState();
}

class _PanelAdminState extends State<PanelAdmin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: myAppBarStep(context),
        body: const TabBarView(children: [
          //arg 0 stat part
          StatsAdmin(),
          //arg 1 produits part
          VmAjoutVet(),
          //arg 2 users part
          UsersAdmin(),
        ]),
      ),
    );
  }
}

AppBar myAppBarStep(BuildContext context) {
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
    title: TextButton(
      onPressed: (() => Navigator.pushNamed(context, '/')),
      child: const Text(
        "Partagez vos 50",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontFamily: "logo", fontSize: 20),
      ),
    ),
    centerTitle: true,
    leading: const GoBackButton(),
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
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(45.0),
      child: TabBar(
          indicatorColor: Colors.white,
          labelStyle: mTextTab,
          unselectedLabelStyle: mTextTabUnselected,
          labelColor: Color.fromARGB(255, 31, 31, 31),
          indicatorWeight: 3,
          tabs: [
            Text(
              "Stats",
            ),
            Text(
              "Produits",
            ),
            Text(
              "Users",
            ),
          ]),
    ),
  );
}
