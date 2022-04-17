import 'package:demo_cars/app/modules/vehicles/controllers/vehicles_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class EditVehicleView extends GetView {
  VehiclesController vehiclesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EditVehicleView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: vehiclesController.nameCtr,
                  decoration: const InputDecoration(label: Text('Name')),
                ),
                TextField(
                  controller: vehiclesController.modelCtr,
                  decoration: const InputDecoration(label: Text('Model')),
                ),
                TextField(
                  controller: vehiclesController.colorCtr,
                  decoration: const InputDecoration(label: Text('Color')),
                ),
                TextField(
                  controller: vehiclesController.yearCtr,
                  decoration: const InputDecoration(label: Text('Year')),
                ),
                TextField(
                  controller: vehiclesController.vinCtr,
                  decoration: const InputDecoration(label: Text('VIN')),
                ),
                TextField(
                  controller: vehiclesController.priceCtr,
                  decoration: const InputDecoration(label: Text('Price')),
                ),
                TextField(
                  controller: vehiclesController.availCtr,
                  decoration: const InputDecoration(label: Text('Availability')),
                ),
                _saveBtn()
              ],
            ),
          ),
        ));
  }

  Widget _saveBtn() => MaterialButton(
        onPressed: () => vehiclesController.onSavedPressed(),
        color: Colors.blue,
        child: const Text('Save'),
      );
}
