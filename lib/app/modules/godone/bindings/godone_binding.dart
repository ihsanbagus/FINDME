import 'package:get/get.dart';

import '../controllers/godone_controller.dart';

class GodoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GodoneController>(
      () => GodoneController(),
    );
  }
}
