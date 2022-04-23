import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:partagez_vos_50/data/models/Produit.dart';

class DatabaseProduit {
  final String uid;

  DatabaseProduit({required this.uid});

  final produitsCollection = FirebaseFirestore.instance.collection('produits');

  Future<void> addProduits(InfoProduit produit) async {
    return await produitsCollection.doc(uid).set({
      "titre": produit.titre,
      "description": produit.description,
      "prix": produit.prix,
      "categorie": produit.categorie,
      "taille": produit.tailles
    });
  }
}
