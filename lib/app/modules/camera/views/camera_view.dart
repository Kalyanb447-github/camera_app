import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraPageController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<CameraPageController>(
      init: CameraPageController(),
      builder: (_) {
        if (controller.isCameraInitialized.value == true) {
          return Scaffold(
              body: AspectRatio(
            aspectRatio: 1 / controller.newCameraController.value.aspectRatio,
            child: controller.newCameraController.buildPreview(),
          ));
        } else {
          return Container();
        }
      },
    );
  }
}
