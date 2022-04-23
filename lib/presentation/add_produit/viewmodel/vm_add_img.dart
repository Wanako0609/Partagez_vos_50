import 'package:flutter/material.dart';

import '../widget/widget_add_img.dart';

class AddImgVetSection extends StatefulWidget {
  const AddImgVetSection({Key? key}) : super(key: key);

  @override
  State<AddImgVetSection> createState() => _AddImgVetSectionState();
}

class _AddImgVetSectionState extends State<AddImgVetSection> {
  @override
  Widget build(BuildContext context) {
    return const AddImgWidget();
  }
}
