import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../main.dart';
import '../views/components/DisplayPictureScreen.dart';

class CameraPageController extends GetxController {
  late CameraController newCameraController;

  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  // late final CameraDescription camera;

  List<XFile> listOfTakenImage = <XFile>[].obs;

  @override
  void onInit() {
    super.onInit();

    initializeCamera();
  }

  initializeCamera() async {
    // Obtain a list of the available cameras on the device.

    // To display the current output from the Camera,
    // create a CameraController.
    cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    initializeControllerFuture = cameraController.initialize();

// Get a specific camera from the list of available cameras.
  }

  takenPicture() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.

      final image = await cameraController.takePicture();

      listOfTakenImage.add(image);
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  showImage(image) {
    Get.to(
      DisplayPictureScreen(
        // Pass the automatically generated path to
        // the DisplayPictureScreen widget.
        imagePath: image.path,
      ),
    );
  }

  shareFile(imagePath) {
    Share.shareXFiles([XFile(imagePath)], text: 'sending picture');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cameraController.dispose();

    super.onClose();
  }
}
