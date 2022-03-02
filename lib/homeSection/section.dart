import 'package:flutter/material.dart';

import 'topclothe.dart';
import 'package:partagez_vos_50/constants.dart';

import 'package:partagez_vos_50/all_Item/item.dart';

//une partie de la page principal
class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Nos Hauts",
              style: TextStyle(color: mTextColor, fontSize: 20),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyItemPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: mIconColor,
                  )),
            )
          ],
        ),
        TopClothe(height: 150)
      ],
    );
  }
}
