import 'package:flutter/material.dart';

class ImageProfilPage extends StatelessWidget {
  const ImageProfilPage({Key? key, this.iconSize = 50}) : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.person, size: 100);
  }
}
