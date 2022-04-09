import 'package:flutter/material.dart';

class UserError extends StatelessWidget {
  const UserError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
            child: Text(
                "Oups une erreur s'est produite veillez vous reconnecter")),
        Icon(
          Icons.error,
          size: 50,
          color: Colors.redAccent,
        )
      ],
    );
  }
}
