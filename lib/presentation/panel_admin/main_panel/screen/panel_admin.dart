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
        appBar: myAppBarRetour(context: context, bottom: bottom()),
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

PreferredSize bottom() {
  return const PreferredSize(
    preferredSize: Size.fromHeight(30.0),
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
  );
}
