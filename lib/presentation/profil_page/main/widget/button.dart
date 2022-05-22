import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

class ButtonUserPage extends StatelessWidget {
  const ButtonUserPage(
      {required this.text, required this.icon, required this.page, Key? key})
      : super(key: key);

  final String text;
  final IconData icon;
  final String page;

  @override
  Widget build(BuildContext context) {
    double radius = 20;
    return GestureDetector(
      onTap: (() => Navigator.pushNamed(context, page)),
      child: Container(
          height: 80,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: mTextFieldBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
          ),
          child: _contain(icon, text)),
    );
  }
}

Widget _contain(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 30,
              color: mSecondColor,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: mContainUsers,
            ),
          ],
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}

class ButtonUserPageDeconnexion extends StatelessWidget {
  const ButtonUserPageDeconnexion(
      {required this.text,
      required this.icon,
      required this.commande,
      Key? key})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function() commande;

  @override
  Widget build(BuildContext context) {
    double radius = 20;
    return GestureDetector(
      onTap: commande,
      child: Container(
          height: 80,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: mTextFieldBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
          ),
          child: _contain(icon, text)),
    );
  }
}
