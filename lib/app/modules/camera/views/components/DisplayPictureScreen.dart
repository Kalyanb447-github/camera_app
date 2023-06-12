import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/camera_controller.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends GetView<CameraPageController> {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
        child: SizedBox(
          height: Get.height * .5,
          width: Get.width * .6,
          child: Image.file(
            File(imagePath),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        // Provide an onPressed callback.
        onPressed: () async {
          controller.shareFile(imagePath);
        },
        label: const Text('Share Image'),
      ),
    );
  }
}
