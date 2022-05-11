import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class UserError extends StatelessWidget {
  const UserError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Oups une erreur s'est produite veillez vous reconnecter",
            ),
          ),
          IconButton(
            icon: const Icon(Icons.error, size: 50, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
      ),
    );
  }
}
