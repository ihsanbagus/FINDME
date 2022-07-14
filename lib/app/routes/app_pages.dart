import 'package:get/get.dart';

import 'package:findme/app/modules/facescan/bindings/facescan_binding.dart';
import 'package:findme/app/modules/facescan/views/facescan_view.dart';
import 'package:findme/app/modules/godone/bindings/godone_binding.dart';
import 'package:findme/app/modules/godone/views/godone_view.dart';
import 'package:findme/app/modules/home/bindings/home_binding.dart';
import 'package:findme/app/modules/home/views/home_view.dart';
import 'package:findme/app/modules/login/bindings/login_binding.dart';
import 'package:findme/app/modules/login/views/login_view.dart';
import 'package:findme/app/modules/recognitions/bindings/recognitions_binding.dart';
import 'package:findme/app/modules/recognitions/views/recognitions_view.dart';
import 'package:findme/app/modules/tasklist/bindings/tasklist_binding.dart';
import 'package:findme/app/modules/tasklist/views/tasklist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECOGNITIONS,
      page: () => RecognitionsView(),
      binding: RecognitionsBinding(),
    ),
    GetPage(
      name: _Paths.FACESCAN,
      page: () => FacescanView(),
      binding: FacescanBinding(),
    ),
    GetPage(
      name: _Paths.TASKLIST,
      page: () => TasklistView(),
      binding: TasklistBinding(),
    ),
    GetPage(
      name: _Paths.GODONE,
      page: () => GodoneView(),
      binding: GodoneBinding(),
    ),
  ];
}
