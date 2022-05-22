import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/main/screen/main_page.dart';

import '../../../data/models/produit.dart';
import '../all_item/screen/item.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

//une partie de la page principal
// ignore: must_be_immutable
class Section extends StatelessWidget {
  Section(
      {Key? key,
      this.title = "Titre de colone",
      this.listItem = const MyMainColumn(),
      required this.produits})
      : super(key: key);

  //listItem et produits doivent etre le meme !
  final String title;
  final List<Produit> produits;
  Widget listItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(color: mTextColor, fontSize: 20),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyItemPage(
                        produits: produits,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.filter_list,
                color: mIconColor,
              ),
            ),
          ],
        ),
        listItem
      ],
    );
  }
}
