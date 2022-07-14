import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    FlutterNativeSplash.remove();
  }
}
