import 'package:flutter/material.dart';

class UserError extends StatelessWidget {
  const UserError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Oups une erreur s'est produite veillez vous reconnecter"),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/login"),
            child: const Text("Login"))
      ],
    );
  }
}
