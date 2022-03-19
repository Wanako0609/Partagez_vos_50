import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';

import '../widget/change_name_widget.dart';

class ChangeNameVm extends StatelessWidget {
  const ChangeNameVm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: ChangeNameWidget(),
    );
  }
}
