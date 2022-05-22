import 'dart:typed_data';

import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partagez_vos_50/presentation/commun/button.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

import '../appbar.dart';

class CropperScreenWeb extends StatefulWidget {
  const CropperScreenWeb({Key? key}) : super(key: key);

  @override
  State<CropperScreenWeb> createState() => _CropperScreenWebState();
}

class _CropperScreenWebState extends State<CropperScreenWeb> {
  final ImagePicker _picker = ImagePicker();
  final GlobalKey _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  Uint8List? _imageToCrop;
  Uint8List? _croppedImage;
  final OverlayType _overlayType = OverlayType.grid;
  Image? imageReturn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBarRetour(context: context),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: mMyButton(
                    texte: 'Choisis une image web',
                    onpressed: () async {
                      final image = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (image != null) {
                        final imageBytes = await image.readAsBytes();
                        setState(() {
                          _imageToCrop = imageBytes;
                        });
                      }
                    }),
              ),
              _imageToCrop != null
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 390,
                        child: Cropper(
                          cropperKey: _cropperKey,
                          overlayType: _overlayType,
                          image: Image.memory(_imageToCrop!),
                        ),
                      ),
                    )
                  : Container(color: mBackgroundColor),
              const SizedBox(height: 16),
              _imageToCrop != null
                  ? mMyButton(
                      texte: 'Rogner l\'image pour continuer',
                      onpressed: () async {
                        final imageBytes = await Cropper.crop(
                          cropperKey: _cropperKey,
                        );

                        if (imageBytes != null) {
                          setState(() {
                            _croppedImage = imageBytes;
                          });
                        }
                      },
                    )
                  : Container(),
              const SizedBox(height: 16),
              _croppedImage != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Image.memory(_croppedImage!),
                        ),
                        mMyButton(
                            texte: "Garder cette image !",
                            onpressed: () {
                              imageReturn = Image.memory(_croppedImage!);
                              Navigator.pushNamed(context, "/addVet",
                                  arguments: imageReturn);
                            })
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
