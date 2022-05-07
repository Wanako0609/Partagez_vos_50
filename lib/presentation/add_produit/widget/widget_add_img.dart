import 'package:cropperx/cropperx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddImgWidget extends StatefulWidget {
  const AddImgWidget({Key? key}) : super(key: key);

  @override
  State<AddImgWidget> createState() => _AddImgWidgetState();
}

class _AddImgWidgetState extends State<AddImgWidget> {
  Image? image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageByte = await image.readAsBytes();

      // Define a key
      final _cropperKey = GlobalKey(debugLabel: 'cropperKey');

      // Add the Cropper widget to your tree, using the above key and adding the image to crop
      Cropper(
        overlayType: OverlayType.rectangle,
        cropperKey: _cropperKey, // Use your key here
        image: Image.memory(imageByte),
      );

      // Get the cropped image as bytes
      final finalimageBytes = await Cropper.crop(
        cropperKey: _cropperKey, // Reference it through the key
      );

      if (finalimageBytes == null) return;

      setState(() =>
          this.image = Image.memory(finalimageBytes, width: 600, height: 300));
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

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
              getImage();
            },
          )),
    );
  }
}

Widget showIcon(Image? image) {
  if (image != null) {
    if (kIsWeb) {
      return image;
    } else {
      return image;
    }
  } else {
    return const Icon(Icons.add_a_photo, size: 200);
  }
}
