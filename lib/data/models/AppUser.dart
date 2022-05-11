import 'package:partagez_vos_50/data/models/addresse.dart';

class AppUser {
  final String uid;
  final String? email;
  final String? password;
  final String? nom;
  final String? prenom;
  final Address? address;
  final String? panier;
  final bool isAdmin;
  final String? numero;

  AppUser(
      {this.uid = "",
      this.nom,
      this.prenom,
      required this.email,
      this.password,
      this.panier,
      this.address,
      this.isAdmin = false,
      this.numero});
}
