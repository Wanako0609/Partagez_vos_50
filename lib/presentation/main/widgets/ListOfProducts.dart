import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/data/models/Produit.dart';

//firebase link
class ListOfProduits extends StatelessWidget {
  ListOfProduits({this.height = 150, this.width = 150, required this.produits});

  double height;
  double width;
  final List<Produit> produits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: produits.length,
        itemBuilder: (BuildContext context, int index) {
          final Produit item = produits[index];
          String imagelink = item.imagelink;
          return Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Card(
              elevation: 10,
              color: mPriceColor,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height,
                    color: mPriceColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imagelink),
                    ),
                  ),
                  Container(
                    width: width,
                    height: 30,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 3, bottom: 3),
                      child: Text(
                        item.price.toString() + " €",
                        style: const TextStyle(color: mTextMainPriceColor),
                      ),
                    ),
                    color: mPriceColor,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
