import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/viewmodels/vm_panel_admin.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: const VmPanelAdmin(),
    );
  }
}
