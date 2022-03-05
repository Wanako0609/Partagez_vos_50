import 'package:flutter/material.dart';
import 'package:partagez_vos_50/main_activity/mainPage.dart';

import '../models/Produit.dart';
import 'ListOfProducts.dart';
import 'package:partagez_vos_50/commun/constants.dart';

import 'package:partagez_vos_50/produits_activity/item.dart';

//une partie de la page principal
class Section extends StatelessWidget {
  Section(
      {this.title = "Titre de colone",
      this.listItem = const MyMainColumn(),
      required this.produits});

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
                Icons.more_vert,
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
