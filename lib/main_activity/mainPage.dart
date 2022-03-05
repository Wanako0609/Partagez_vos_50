import 'package:flutter/material.dart';

import 'ListOfProducts.dart';
import 'listItemData/pants.dart';
import 'listItemData/veste.dart';
import 'section.dart';
import 'listItemData/top.dart';

//page principal
class MyMainColumn extends StatelessWidget {
  const MyMainColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Section(
            title: "Nos Hauts",
            produits: topProduits,
            listItem: ListOfProduits(
              produits: topProduits,
            ),
          ),
          Section(
            title: "Nos Bas",
            produits: bottomProduits,
            listItem: ListOfProduits(
              produits: bottomProduits,
            ),
          ),
          Section(
            title: "Nos Vestes",
            produits: vesteProduits,
            listItem: ListOfProduits(
              produits: vesteProduits,
            ),
          ),
        ],
      ),
    );
  }
}
