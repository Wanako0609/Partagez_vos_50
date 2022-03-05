class Produit {
  final String name;
  final String? type;
  final int? letterSize;
  final String? numberSize;
  final String description;
  final String imagelink;
  final int price;

  Produit(
      {this.name = "",
      this.description = "",
      this.imagelink = "",
      this.letterSize,
      this.numberSize,
      this.price = 1,
      this.type});
}
