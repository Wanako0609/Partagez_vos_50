import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

import '../viewmodel/vm_section_address.dart';
import '../viewmodel/vm_section_isadmin.dart';
import '../viewmodel/vm_section_name.dart';

class UserProfilPage extends StatelessWidget {
  const UserProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarRetour(context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Information General", style: mTextUserTitle),
              const SizedBox(height: 20),
              UserNameSection(),
              const Text("Adresse", style: mTextUserTitle),
              UserAddressSectionVM(),
              const SizedBox(height: 20),
              const IsAdminSectionVm(),
            ],
          ),
        ),
      ),
    );
  }
}
