import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:uuid/uuid.dart';

import '../../commun/constants.dart';
import '../viewmodel/vm_information.dart';
import '../widget/widget_add_img.dart';

class AddVetPage extends StatelessWidget {
  const AddVetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var priceController = TextEditingController();
    List<String> tailleChoisis = [];
    List<String> categoriesChoisis = [];

    //uuid du produit
    var uuid = const Uuid().v4();

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
                InformationVetVM(
                  tailleChoisis: tailleChoisis,
                  categoriesChoisis: categoriesChoisis,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  priceController: priceController,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print(categoriesChoisis);
                    },
                    child: const Text(
                      "Ajoute !",
                      style: TextStyle(fontSize: 15),
                    ),
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
