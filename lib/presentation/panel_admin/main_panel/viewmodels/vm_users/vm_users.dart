import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("Il n'y a pas de donnée !");
          return ListView(children: informationUsers(snapshot));
        });
  }

  informationUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map(
          (doc) => ListTile(
            title: Text(doc["email"]),
            subtitle: Text(
              doc["email"].toString(),
            ),
          ),
        )
        .toList();
  }
}
