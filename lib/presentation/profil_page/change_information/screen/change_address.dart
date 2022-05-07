import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/presentation/profil_page/change_information/viewmodel/vm_change_name.dart';

import '../viewmodel/vm_change_address.dart';

class UserChangeAddress extends StatelessWidget {
  const UserChangeAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarRetour(context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Modifier votre adresse",
                  style: mTextUserTitle,
                ),
              ),
              ChangeAddressVm(),
            ],
          ),
        ),
      ),
    );
  }
}
