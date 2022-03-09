class Produit {
  final String name;
  final String? type;
  final int? numberSize;
  final String? letterSize;
  final String description;
  final String imagelink;
  final int price;
  final int numberProduct;

  Produit(
      {required this.name,
      required this.description,
      this.imagelink = "",
      this.letterSize,
      this.numberSize,
      required this.price,
      this.type,
      required this.numberProduct});
}
