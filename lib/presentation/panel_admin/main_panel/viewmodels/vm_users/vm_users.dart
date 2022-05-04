import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/panel_admin/main_panel/widget/users/alertedialog.dart';

final userCollection = FirebaseFirestore.instance.collection('users');

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text("Il n'y a pas de donnée !");
          return ListView(children: informationUsers(snapshot, context));
        });
  }

  informationUsers(
      AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data?.docs
        .map(
          (doc) => SizedBox(
            height: 80,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doc["email"],
                      style: const TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: const Icon(Icons.person_add),
                            onPressed: (() {}),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
