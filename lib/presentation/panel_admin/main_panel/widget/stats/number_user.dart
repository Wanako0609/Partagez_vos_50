import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class UserNumber extends StatefulWidget {
  const UserNumber({Key? key}) : super(key: key);

  @override
  State<UserNumber> createState() => _UserNumberState();
}

class _UserNumberState extends State<UserNumber> {
  @override
  Widget build(BuildContext context) {
    DatabaseUsers users = DatabaseUsers(uid: "no-data");
    Future<int> number = users.countDocuments();

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
                      Text("Utilisateur", style: mTextUserInformation),
                      Icon(Icons.person)
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
                    Text("Utilisateur", style: mTextUserInformation),
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
