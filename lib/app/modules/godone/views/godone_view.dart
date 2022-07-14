import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/godone_controller.dart';

class GodoneView extends GetView<GodoneController> {
  Widget cameraView(cc) => Container(
        height: double.infinity,
        width: double.infinity,
        child: CameraPreview(
          cc,
          key: Key('cameraPreview'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: () {
                    Get.back();
                  },
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text('Foto Wajah dan QR Code'),
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.switchCamera();
                    },
                    icon: const Icon(Icons.cameraswitch),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: FloatingActionButton(
                  heroTag: "takePicture",
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  enableFeedback: true,
                  onPressed: () async {
                    // final image = await cc.takePicture();
                    Get.defaultDialog(
                      title: "Selamat! 🎊",
                      middleText: "Hore! ✨ Kamu Berhasil Menemukannya. 🎉",
                      radius: 30,
                    );
                  },
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    controller.initCamera();
    return Scaffold(
      body: controller.obx(
        (cameraController) => cameraView(cameraController),
        onError: (e) => Center(
          child: Text(e.toString()),
        ),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
