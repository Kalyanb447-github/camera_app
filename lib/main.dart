import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

late final cameras;
late final firstCamera;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  firstCamera = cameras.first;

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
