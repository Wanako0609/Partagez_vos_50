import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/viewmodels/vm_ajout_vet.dart';

import '../../../commun/constants.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarRetour(context),
      body: Center(
        child: Column(
          children: const [
            Text("Panel Administrateur", style: mTextUserTitle),
            SizedBox(height: 20),
            VmAjoutVet(),
          ],
        ),
      ),
    );
  }
}
