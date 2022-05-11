import 'package:flutter/material.dart';

class ImageProfilPage extends StatelessWidget {
  const ImageProfilPage({this.iconSize = 50});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.person, size: 100);
  }
}
