import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partagez_vos_50/presentation/commun/appbar.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

import '../button.dart';

class CropperScreenMobile extends StatefulWidget {
  const CropperScreenMobile({Key? key}) : super(key: key);

  @override
  State<CropperScreenMobile> createState() => _CropperScreenMobileState();
}

class _CropperScreenMobileState extends State<CropperScreenMobile> {
  final ImagePicker _picker = ImagePicker();
  bool asFile = false;
  Image? imageReturn;
  late String path;

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
                  texte: 'Choisis une image mobile',
                  onpressed: () async {
                    final image = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (image != null) {
                      CroppedFile? croppedFile = await ImageCropper().cropImage(
                        sourcePath: image.path,
                        aspectRatio:
                            const CropAspectRatio(ratioX: 3, ratioY: 4),
                        maxHeight: 700,
                        maxWidth: 700,
                        uiSettings: [
                          AndroidUiSettings(
                              toolbarTitle: 'Rogne ton image',
                              toolbarColor: mPrimaryColor,
                              toolbarWidgetColor: Colors.white,
                              initAspectRatio: CropAspectRatioPreset.ratio4x3,
                              hideBottomControls: true,
                              lockAspectRatio: false),
                          IOSUiSettings(
                            title: 'Rogne ton image',
                          ),
                        ],
                      );
                      if (croppedFile != null) {
                        setState(() {
                          path = croppedFile.path;
                          asFile = true;
                        });
                      } else {
                        log("Image pas crop", name: "Image error");
                      }
                    } else {
                      log("Pas d'image choisi", name: "Image error");
                    }
                  },
                ),
              ),
              if (asFile)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.file(File(path)),
                      ),
                    ),
                    mMyButton(
                        texte: "Garder cette image !",
                        onpressed: () {
                          imageReturn = Image.file(File(path));
                          Navigator.pushNamed(context, "/addVet",
                              arguments: imageReturn);
                        })
                  ],
                )
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}
