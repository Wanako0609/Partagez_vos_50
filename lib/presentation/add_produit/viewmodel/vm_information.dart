import 'package:flutter/material.dart';

import '../widget/widget_information.dart';
import '../widget/widget_multiselect.dart';

class InformationVetVM extends StatefulWidget {
  InformationVetVM(
      {required this.titleController,
      required this.descriptionController,
      required this.priceController,
      required this.categoriesChoisis,
      required this.tailleChoisis});

  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController priceController;
  List<String> tailleChoisis = [];
  List<String> categoriesChoisis = [];

  @override
  State<InformationVetVM> createState() => _InformationVetVMState();
}

class _InformationVetVMState extends State<InformationVetVM> {
  @override
  Widget build(BuildContext context) {
    final List<String> taille = ["XS", "S", "M", "L", "XL"];
    final List<String> categories = ["Tee Shirt", "Veste", "Pull"];

    return Column(
      children: [
        AddVetDescription(label: "Titre", controller: widget.titleController),
        const SizedBox(height: 15),
        SelectInformation(
            list: categories,
            whenEmpty: "Categorie",
            listReturn: widget.categoriesChoisis),
        const SizedBox(height: 15),
        AddVetDescription(
            label: "Description", controller: widget.descriptionController),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: AddVetDescription(
                  label: "Prix", controller: widget.priceController),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SelectInformation(
                  list: taille,
                  whenEmpty: "Taille",
                  listReturn: widget.tailleChoisis),
            ),
          ],
        )
      ],
    );
  }
}
