import 'package:camera/camera.dart';
import 'package:get/get.dart';

class GodoneController extends GetxController
    with StateMixin<CameraController> {
  late CameraController cameraController;
  var camDes = <CameraDescription>[].obs;
  var cameraDescription = Rxn<CameraDescription>();

  void switchCamera() {
    initCamera();
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
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
