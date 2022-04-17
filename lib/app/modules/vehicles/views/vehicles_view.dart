import 'package:demo_cars/app/modules/vehicles/model/vehicle_model.dart';
import 'package:demo_cars/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vehicles_controller.dart';

class VehiclesView extends GetView<VehiclesController> {
  VehiclesView({Key? key}) : super(key: key);
  VehiclesController vehiclesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vehicles View'),
          centerTitle: true,
        ),
        body: controller.obx((state) => _item(state!),
            onEmpty: const Center(child: Text('No Vehicle Found')),
            onError: (error) => Center(child: Text(error!))));
  }

  Widget _item(Cars car) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              const Icon(
                Icons.car_repair,
                size: 86,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => vehiclesController.onBackwardPressed(),
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        size: 36,
                      )),
                  Text(
                    '${controller.itemCount.value+1}. ${car.car!}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => vehiclesController.onForwordPressed(),
                      icon: const Icon(
                        Icons.chevron_right_rounded,
                        size: 36,
                      )),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              _rowItem('Car Model', car.carModel!),
              _rowItem('Color', car.carColor!),
              _rowItem('Year', car.carModelYear!.toString()),
              _rowItem('VIN', car.carVin!),
              _rowItem('Price', car.price!),
              _rowItem('Availability', car.availability!.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_editBtn(), _deleteBtn()],
              ),
            ],
          ),
        ),
      );

  Widget _rowItem(String name, String value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text(value),
          ],
        ),
      );

  Widget _editBtn() => MaterialButton(
        onPressed: () =>vehiclesController.onEditPressed(),
        color: Colors.green,
        child: const Text('Edit'),
      );
  Widget _deleteBtn() => MaterialButton(
        onPressed: () => vehiclesController.onDeletePressed(),
        color: Colors.red,
        child: const Text('Delete'),
      );
}
