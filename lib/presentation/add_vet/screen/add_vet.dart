import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/add_vet/widget/widget_add_img.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';

import '../../commun/constants.dart';
import '../viewmodel/vm_information.dart';

class AddVetPage extends StatelessWidget {
  const AddVetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarRetour(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Ajout de vetement !", style: mTextUserTitle),
                const SizedBox(height: 20),
                const AddImgWidget(),
                const InformationVetVM(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Ajoute !"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
