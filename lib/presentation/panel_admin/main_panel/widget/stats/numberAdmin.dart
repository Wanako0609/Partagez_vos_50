import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class AdminUserNumber extends StatefulWidget {
  const AdminUserNumber({Key? key}) : super(key: key);

  @override
  State<AdminUserNumber> createState() => _AdminUserNumberState();
}

class _AdminUserNumberState extends State<AdminUserNumber> {
  @override
  Widget build(BuildContext context) {
    DatabaseUsers users = DatabaseUsers(uid: "no-data");
    Future<int> number = users.countAdminDocuments();

    return FutureBuilder(
      future: number,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Admin", style: mTextUserInformation),
                      Icon(Icons.verified_user)
                    ],
                  ),
                  Text("${snapshot.data!}", style: mNumberStats)
                ],
              ),
            ),
          );
        } else {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Admin", style: mTextUserInformation),
                    SizedBox(width: 20),
                    Icon(Icons.verified_user)
                  ],
                ),
                const Text(
                  "Pas de donnee",
                  style: mNumberStats,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
