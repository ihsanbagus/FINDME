import 'package:get/get.dart';

import '../controllers/facescan_controller.dart';

class FacescanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacescanController>(() => FacescanController());
  }
}
