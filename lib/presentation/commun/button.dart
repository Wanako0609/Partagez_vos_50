import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

Container mMyButton(
    {LinearGradient gradient = mButtonGradient,
    double radius = 20,
    double height = 50,
    required String texte,
    double fontSize = 18,
    Color textColor = Colors.white,
    required Function()? onpressed,
    FontWeight weight = FontWeight.normal}) {
  return Container(
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    ),
    height: height,
    width: double.maxFinite,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      onPressed: onpressed,
      child: Text(texte,
          style: TextStyle(
              fontSize: fontSize, color: textColor, fontWeight: weight)),
    ),
  );
}
