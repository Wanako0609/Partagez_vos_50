import 'package:flutter/material.dart';

import '../widget/widget_add_img.dart';

// ignore: must_be_immutable
class AddImgVetSection extends StatefulWidget {
  AddImgVetSection({Key? key, this.image}) : super(key: key);
  Image? image;

  @override
  State<AddImgVetSection> createState() => _AddImgVetSectionState();
}

class _AddImgVetSectionState extends State<AddImgVetSection> {
  @override
  Widget build(BuildContext context) {
    return AddImgWidget(image: widget.image);
  }
}
