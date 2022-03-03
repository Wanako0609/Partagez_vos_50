import 'package:flutter/material.dart';

import 'topclothe.dart';
import 'package:partagez_vos_50/commun/constants.dart';
import 'section.dart';

//page principal
class MyMainColumn extends StatelessWidget {
  const MyMainColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          Section(),
          Section(),
          Section(),
          Section(),
        ],
      ),
    );
  }
}
