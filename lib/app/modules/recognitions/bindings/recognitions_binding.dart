import 'package:get/get.dart';

import '../controllers/recognitions_controller.dart';

class RecognitionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecognitionsController>(
      () => RecognitionsController(),
    );
  }
}
