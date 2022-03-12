class Address {
  final String rue;
  final int codePostal;
  final String ville;
  final String pays;
  final String nom;
  final String prenom;

  Address(
      {required this.rue,
      this.pays = "France",
      required this.codePostal,
      required this.ville,
      required this.nom,
      required this.prenom});

  Map<String, dynamic> toMap() {
    return {
      "Rue": rue,
      "Code Postal": codePostal,
      "Ville": ville,
      "Pays": pays
    };
  }
}
