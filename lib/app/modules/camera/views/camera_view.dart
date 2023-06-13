import 'dart:io';

// import 'package:camera_camera/camera_camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraPageController> {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      body: FutureBuilder<void>(
        future: controller.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: <Widget>[
                Center(
                  child: Transform.scale(
                    scale: controller.cameraController.value.aspectRatio /
                        deviceRatio,
                    child: AspectRatio(
                      aspectRatio:
                          controller.cameraController.value.aspectRatio,
                      child: CameraPreview(controller.cameraController),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: Get.height * .1,
                  child: Center(
                    child: SizedBox(
                      height: Get.height * .1,
                      width: Get.width,
                      child: Center(
                        child: Obx(
                          () {
                            if (controller.listOfTakenImage.isEmpty) {
                              return const Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              );
                            } else {
                              return ListView.separated(
                                itemCount: controller.listOfTakenImage.length,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  final singleImage =
                                      controller.listOfTakenImage[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.showImage(singleImage);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(singleImage.path),
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          controller.takenPicture();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
