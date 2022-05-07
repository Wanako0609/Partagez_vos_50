import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

import '../../../../../data/bdd/firestore/database_user.dart';

Future<Object?> setAdminDialogue(
    BuildContext context, String uid, String email) {
  return showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white54,
                Colors.black54,
              ],
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: dialiog(uid, email, context),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}

Padding dialiog(String uid, String email, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 80),
            Text("Administration",
                style: TextStyle(
                    fontSize: 25,
                    color: mPrimaryColor,
                    decoration: TextDecoration.underline)),
            SizedBox(height: 20),
            Text("Voulez vous que il devienne un administrateur ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  DatabaseUsers(uid: uid).setAdmin(false);
                  print("$email n'est plus administrateur");
                  Navigator.of(context).pop();
                },
                child: const Text("Non", style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  DatabaseUsers(uid: uid).setAdmin(true);
                  print("$email est administrateur");
                  Navigator.of(context).pop();
                },
                child: const Text("Oui", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  elevation: 10,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
