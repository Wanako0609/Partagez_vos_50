import 'package:partagez_vos_50/data/models/Addresse.dart';

class AppUser {
  final String uid;
  final String? name;
  final String? panier;
  final Address? address;

  AppUser({this.uid = "", this.name, this.panier, this.address});
}
