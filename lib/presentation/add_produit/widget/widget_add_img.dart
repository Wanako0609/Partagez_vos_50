import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddImgWidget extends StatelessWidget {
  AddImgWidget({Key? key, this.image}) : super(key: key);
  Image? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: 200,
        child: GestureDetector(
          child: showIcon(image),
          onTap: () {
            if (kIsWeb) {
              Navigator.pushNamed(context, "/getImageWeb");
            } else {
              Navigator.pushNamed(context, "/getImageMobile");
            }
          },
        ),
      ),
    );
  }
}

Widget showIcon(Image? image) {
  if (image != null) {
    return SizedBox(height: 300, width: 300, child: image);
  } else {
    return const Icon(Icons.add_a_photo, size: 200);
  }
}
