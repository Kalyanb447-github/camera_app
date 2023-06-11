import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController {
  late CameraController newCameraController;
  RxBool isCameraInitialized = false.obs;
  // @override
  // void onInit() {
  //   newCameraController = CameraController(cameras[0], ResolutionPreset.max);

  //   onNewCameraSelected(cameras[0]);

  //   super.onInit();
  // }

  // void onNewCameraSelected(CameraDescription cameraDescription) async {
  //   final previousCameraController = newCameraController;
  //   // Instantiating the camera controller
  //   final CameraController cameraController = CameraController(
  //     cameraDescription,
  //     ResolutionPreset.high,
  //     imageFormatGroup: ImageFormatGroup.jpeg,
  //   );

  //   // Dispose the previous controller
  //   await previousCameraController.dispose();

  //   // Replace with the new controller

  //   newCameraController = cameraController;

  //   // Update UI if controller updated
  //   cameraController.addListener(() {});

  //   // Initialize controller
  //   try {
  //     await cameraController.initialize();
  //   } on CameraException catch (e) {
  //     print('Error initializing camera: $e');
  //   }

  //   // Update the Boolean

  //   isCameraInitialized.value = newCameraController.value.isInitialized;

  //   newCameraController.takePicture();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
