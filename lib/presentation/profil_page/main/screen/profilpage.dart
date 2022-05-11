import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';

import '../vm/head.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarRetour(context: context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: const [SizedBox(height: 90), HeaderUsers()],
        ),
      ),
    );
  }
}
