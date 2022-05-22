import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/commun/button.dart';
import 'package:uuid/uuid.dart';

import '../../commun/constants.dart';
import '../viewmodel/vm_add_img.dart';
import '../viewmodel/vm_information.dart';

// ignore: must_be_immutable
class AddVetPage extends StatelessWidget {
  AddVetPage({Key? key, this.image}) : super(key: key);
  Image? image;

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
      appBar: myAppBarRetour(context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText("Ajout de vetement !",
                    style: mTitle, maxLines: 1),
                const SizedBox(height: 20),
                AddImgVetSection(image: image),
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
                  child: mMyButton(
                      texte: "Ajoute un article",
                      onpressed: () {
                        log(uuid, name: "test add");
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
