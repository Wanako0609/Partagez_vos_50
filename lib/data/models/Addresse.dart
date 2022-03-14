class Address {
  final String rue;
  final String codePostal;
  final String ville;
  final String pays;

  Address({
    required this.rue,
    this.pays = "France",
    required this.codePostal,
    required this.ville,
  });

  Map<String, dynamic> toMap() {
    return {
      "Rue": rue,
      "Code Postal": codePostal,
      "Ville": ville,
      "Pays": pays
    };
  }
}
