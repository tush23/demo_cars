import 'package:demo_cars/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            Get.toNamed(Routes.VEHICLES);
          },
          child: const Text('Vehicles'),
        ),
      ),
    );
  }
}
