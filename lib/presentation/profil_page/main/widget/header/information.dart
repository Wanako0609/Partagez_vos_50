import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/appuser.dart';
import '../../../../commun/error_connexion.dart';

class InformationUsers extends StatefulWidget {
  const InformationUsers({Key? key}) : super(key: key);

  @override
  State<InformationUsers> createState() => _InformationUsersState();
}

class _InformationUsersState extends State<InformationUsers> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const UserError();
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.prenom.toString(), style: mNameStyle),
              const SizedBox(width: 8),
              Text(user.nom.toString(), style: mNameStyle),
            ],
          ),
          const SizedBox(height: 8),
          Text(user.email.toString(), style: mTextBasic),
        ],
      );
    }
  }
}
