import 'package:flutter/material.dart';
import 'package:partagez_vos_50/commun/constants.dart';
import 'package:partagez_vos_50/commun/appbar.dart';

import '../models/Produit.dart';

class MyItemPage extends StatelessWidget {
  MyItemPage({this.height = 150, this.width = 150, required this.produits});

  double height;
  double width;
  final List<Produit> produits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: produits.length,
          itemBuilder: (BuildContext context, int index) {
            final Produit item = produits[index];
            String imagelink = item.imagelink;
            return Card(
              elevation: 10,
              color: mPriceColor,
              child: Row(
                children: [
                  Container(
                    width: width,
                    height: height,
                    color: mPriceColor,
                    child: Image.asset(imagelink),
                  ),
                  SizedBox(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produits[index].name,
                            style: mTextTitleProduit,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produits[index].description,
                            style: mTextDescriptionProduit,
                          ),
                          const Spacer(),
                          Text(
                            produits[index].price.toString() + " €",
                            style: mTextPriceProduit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
