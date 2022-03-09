import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partagez_vos_50/data/models/Addresse.dart';

import '../../../models/AppUser.dart';

class DatabaseUsers {
  final String uid;

  DatabaseUsers({required this.uid});

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> saveName(String name) async {
    return await userCollection.doc(uid).set({"name": name});
  }

  Future<void> saveAddress(Address address) async {
    return await userCollection.doc(uid).set({
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
        rue: data["Rue"], codePostal: data["Code Postal"], ville: data["Pays"]);
    return AppUser(uid: uid, name: data["name"], address: userAddress);
  }

  Stream<AppUser> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<AppUser> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUser>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
