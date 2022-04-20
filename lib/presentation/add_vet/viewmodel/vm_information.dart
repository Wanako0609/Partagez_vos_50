import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/add_vet/widget/widget_information.dart';

class InformationVetVM extends StatefulWidget {
  const InformationVetVM({Key? key}) : super(key: key);

  @override
  State<InformationVetVM> createState() => _InformationVetVMState();
}

class _InformationVetVMState extends State<InformationVetVM> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var priceController = TextEditingController();
    var sizeController = TextEditingController();
    return Column(
      children: [
        AddVetDescription(label: "Titre", controller: titleController),
        const SizedBox(height: 15),
        AddVetDescription(
            label: "Description", controller: descriptionController),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child:
                  AddVetDescription(label: "Prix", controller: priceController),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: AddVetDescription(
                  label: "Taille", controller: sizeController),
            )
          ],
        )
      ],
    );
  }
}
