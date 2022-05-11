import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/widget/widget_ajout_vet.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/AppUser.dart';
import '../../../commun/error_connexion.dart';

class VmAjoutVet extends StatelessWidget {
  const VmAjoutVet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const UserError();
    } else {
      return const WidgetAddVet();
    }
  }
}
