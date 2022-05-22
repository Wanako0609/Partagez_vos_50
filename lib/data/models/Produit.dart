// ignore: file_names
//plus utiliser
class Produit {
  final String titre; //obligatoire
  final String? type; //obligatoire a changer en type unique
  final String letterSize; //obligatoire taille dispo
  final String description; //obligatoire
  final String imagelink; //obligatoire
  final int price; //obligatoire
  final int? numberProduct;

  Produit(
      {required this.titre,
      required this.description,
      required this.letterSize,
      required this.price,
      this.imagelink = "",
      this.type,
      this.numberProduct});
}

class InfoProduit {
  final String titre;
  final String description;
  final int prix;
  final List<String> categorie;
  final List<String> tailles;

  InfoProduit(
      {required this.titre,
      required this.description,
      required this.prix,
      required this.categorie,
      required this.tailles});
}
