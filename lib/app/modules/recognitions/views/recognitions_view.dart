import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recognitions_controller.dart';

class RecognitionsView extends GetView<RecognitionsController> {
  @override
  Widget build(BuildContext context) {
    controller.call();
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Recognition'),
        centerTitle: true,
      ),
      body: controller.obx(
        (images) => GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          itemCount: images!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (c, i) => Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(File("${images[i].path}")),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                  child: Text(
                "${images[i].name}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
        ),
        onEmpty: Center(
          child: Text("Daftar Kosong"),
        ),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "CLEAR",
        onPressed: () {
          controller.clear();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
