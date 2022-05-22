import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/appuser.dart';
import '../../../../commun/error_connexion.dart';
import 'alertedialog.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<AppUser?>>(context);
    if (users == []) {
      return const UserError();
    } else {
      return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            String uid = users[index]?.uid as String;
            String email = users[index]?.email as String;
            return SizedBox(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          users[index]?.email as String,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              //test si l'utilisateur est un admin ou pas
                              child: users[index]?.isAdmin == true
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.person_add_disabled,
                                        color: mPrimaryColor,
                                      ),
                                      onPressed: (() {
                                        setAdminDialogue(context, uid, email);
                                      }))
                                  : IconButton(
                                      icon: const Icon(Icons.person_add),
                                      onPressed: (() {
                                        setAdminDialogue(context, uid, email);
                                      }),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          });
    }
  }
}
