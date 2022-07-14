import 'package:findme/app/modules/recognitions/models/face_model.dart';
import 'package:findme/app/utils/local_storage.dart';
import 'package:get/get.dart';

class RecognitionsController extends GetxController
    with StateMixin<List<FaceModel>> {
  var storage = LocalStorage.getStorage();
  var images = <FaceModel>[].obs;

  void call() async {
    change(null, status: RxStatus.loading());
    storage.listenable.value?.forEach((key, value) {
      images.add(FaceModel(name: key, path: value));
    });
    await Future.delayed(Duration(seconds: 3));
    if (images.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(images, status: RxStatus.success());
    }
  }

  void clear() {
    storage.erase().then((_) {
      images.clear();
      call();
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
