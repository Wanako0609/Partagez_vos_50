import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partagez_vos_50/data/models/Addresse.dart';

import '../../../models/AppUser.dart';

class DatabaseUsers {
  final String uid;

  DatabaseUsers({required this.uid});

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> hadCollection() async {
    return await userCollection.doc(uid).get().then((value) => {
          if (value.exists == false) {createEmptyCollection()}
        });
  }

  Future<void> createEmptyCollection() async {
    return await userCollection.doc(uid).set({
      "Nom": "Non renseigner",
      "Prenom": "Non renseigner",
      "Rue": "Non renseigner",
      "Code Postal": "Non renseigner",
      "Ville": "Non renseigner",
      "Pays": "France",
      "isAdmin": false
    });
  }

  Future<void> createUser(AppUser appUser) async {
    Address? address = appUser.address;
    return await userCollection.doc(uid).set({
      "Nom": appUser.nom,
      "Prenom": appUser.prenom,
      "Rue": address!.rue,
      "Code Postal": address.codePostal,
      "Ville": address.ville,
      "Pays": address.pays,
      "isAdmin": false
    });
  }

  Future<void> dataDeleteUser() {
    return userCollection
        .doc(uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> setAdmin(bool isAdmin) async {
    return await userCollection.doc(uid).update({"isAdmin": isAdmin});
  }

  Future<void> saveNom(String nom, String prenom) async {
    return await userCollection.doc(uid).update({"Nom": nom, "Prenom": prenom});
  }

  Future<void> saveAddress(Address address) async {
    return await userCollection.doc(uid).update({
      "Rue": address.rue,
      "Code Postal": address.codePostal,
      "Ville": address.ville,
      "Pays": address.pays
    });
  }

  AppUser _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    Address userAddress = Address(
      rue: data["Rue"],
      codePostal: data["Code Postal"],
      ville: data["Ville"],
    );
    return AppUser(
        uid: uid,
        nom: data["Nom"],
        prenom: data["Prenom"],
        address: userAddress,
        isAdmin: data["isAdmin"]);
  }

  Stream<AppUser?> get userData {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<AppUser> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUser?>> get usersData {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
