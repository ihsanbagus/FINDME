import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/facescan_controller.dart';

class FacescanView extends GetView<FacescanController> {
  Widget cameraView(cc) => Container(
        height: double.infinity,
        width: double.infinity,
        child: CameraPreview(
          cc,
          key: Key('cameraPreview'),
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "tp",
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  enableFeedback: true,
                  onPressed: () async {
                    final image = await cc.takePicture();
                    controller.addFace(image.path);
                  },
                  child: Icon(Icons.camera_alt),
                ),
                FloatingActionButton(
                  heroTag: "sc",
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  enableFeedback: true,
                  onPressed: () {
                    controller.switchCamera();
                  },
                  child: Icon(Icons.cameraswitch_sharp),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    controller.initCamera();
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftarkan Wajah'),
        centerTitle: true,
      ),
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
