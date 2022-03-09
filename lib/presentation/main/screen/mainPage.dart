import 'package:flutter/material.dart';

import '../viewmodel/pants.dart';
import '../widgets/ListOfProducts.dart';
import '../viewmodel/veste.dart';
import '../widgets/section.dart';
import '../viewmodel/top.dart';

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
