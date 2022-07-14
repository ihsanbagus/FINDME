import 'dart:io';

import 'package:findme/app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

class FacescanController extends GetxController
    with StateMixin<CameraController> {
  late CameraController cameraController;
  var camDes = <CameraDescription>[].obs;
  var cameraDescription = Rxn<CameraDescription>();
  final _name = TextEditingController();

  void switchCamera() {
    initCamera();
  }

  void addFace(String path) {
    cameraController.pausePreview();
    var alert = AlertDialog(
      title: const Text("Tambah Wajah"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _name,
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "Nama", icon: Icon(Icons.face)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
            child: const Text("Simpan"),
            onPressed: () {
              LocalStorage.getStorage().write(_name.text, path);
              _name.clear();
              cameraController.resumePreview();
              Get.back();
            }),
        TextButton(
          child: const Text("Batal"),
          onPressed: () async {
            await File(path).delete();
            cameraController.resumePreview();
            Get.back();
          },
        )
      ],
    );
    Get.dialog(alert);
  }

  void initCamera() {
    change(null, status: RxStatus.loading());
    availableCameras().then((cameras) {
      camDes.value = cameras;
      cameraDescription.value =
          cameraDescription.value == camDes.last ? camDes.first : camDes.last;
      cameraController =
          CameraController(cameraDescription.value!, ResolutionPreset.max);
      change(cameraController, status: RxStatus.success());
      cameraController.initialize().then((_) {
        change(cameraController, status: RxStatus.success());
      }).catchError((e) {
        change(null, status: RxStatus.error(e));
      });
    }).catchError((e) {
      change(cameraController, status: RxStatus.error(e));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cameraController.dispose();
  }
}
