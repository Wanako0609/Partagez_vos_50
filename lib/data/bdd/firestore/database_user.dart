import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partagez_vos_50/data/models/addresse.dart';

import '../../models/AppUser.dart';

class DatabaseUsers {
  final String uid;

  DatabaseUsers({required this.uid});

  final userCollection = FirebaseFirestore.instance.collection('users');

  Stream<List<AppUser?>> get usersData {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  Stream<AppUser?> get userData {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  //creation doc
  Future<void> hadCollection(String? email) async {
    return await userCollection.doc(uid).get().then((value) => {
          if (value.exists == false) {createEmptyCollection(email)}
        });
  }

  Future<void> createEmptyCollection(String? email) async {
    return await userCollection.doc(uid).set({
      "Nom": "Non renseigner",
      "Prenom": "Non renseigner",
      "Rue": "Non renseigner",
      "Code Postal": "Non renseigner",
      "Ville": "Non renseigner",
      "Pays": "France",
      "isAdmin": false,
      "email": email,
      "uid": uid
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
      "isAdmin": false,
      "email": appUser.email,
      "uid": uid,
    });
  }

  //supression
  Future<void> dataDeleteUser() {
    return userCollection
        .doc(uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  //modification
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

  //convertion
  AppUser _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    Address userAddress = Address(
      rue: data["Rue"],
      codePostal: data["Code Postal"],
      ville: data["Ville"],
    );
    return AppUser(
        uid: data["uid"],
        nom: data["Nom"],
        email: data["email"],
        prenom: data["Prenom"],
        address: userAddress,
        isAdmin: data["isAdmin"]);
  }

  List<AppUser> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  //recuperation de donner
  Future<int> countDocuments() async {
    QuerySnapshot myDoc = await userCollection.get();
    List<DocumentSnapshot> myDocCount = myDoc.docs;
    return myDocCount.length;
  }

  Future<int> countAdminDocuments() async {
    QuerySnapshot myDoc =
        await userCollection.where("isAdmin", isEqualTo: true).get();
    List<DocumentSnapshot> myDocCount = myDoc.docs;
    return myDocCount.length;
  }

  Future getDoc(String email) async {
    QuerySnapshot myDoc =
        await userCollection.where("email", isEqualTo: email).limit(1).get();
    //DocumentSnapshot doc = myDoc.docs;
    return myDoc;
  }
}
