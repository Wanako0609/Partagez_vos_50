import 'package:partagez_vos_50/data/models/Addresse.dart';

class AppUser {
  final String uid;
  final String? name;
  final String? panier;
  final Address? address;
  final bool isAdmin;

  AppUser(
      {this.uid = "",
      this.name,
      this.panier,
      this.address,
      this.isAdmin = false});
}
