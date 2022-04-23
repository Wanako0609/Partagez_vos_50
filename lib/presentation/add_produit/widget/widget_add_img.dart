import 'package:flutter/material.dart';

class AddImgWidget extends StatelessWidget {
  const AddImgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: IconButton(
          iconSize: 200,
          icon: const Icon(
            Icons.add,
            size: 200,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
