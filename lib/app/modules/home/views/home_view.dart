import 'package:findme/app/modules/home/services/firebase_service.dart';
import 'package:findme/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    FirebaseService fs = FirebaseServiceImpl();
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.local_play),
        centerTitle: true,
      ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.FACESCAN);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.app_registration, size: 50),
                Text("Daftarkan Wajah"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.RECOGNITIONS);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.face, size: 50),
                Text("Daftar Recognition"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.TASKLIST);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.task, size: 50),
                Text("Daftar Pencarian"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.rawSnackbar(
                message: "Masih dalam pengembangan",
                icon: Icon(Icons.error),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              );
              fs.test();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_sharp, size: 50),
                Text("Menu Lain"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
