import 'package:demo_cars/app/api/provider/api_provider.dart';
import 'package:demo_cars/app/modules/vehicles/model/vehicle_model.dart';
import 'package:demo_cars/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VehiclesController extends GetxController with StateMixin<Cars> {
  final ApiProvider _apiProvider = Get.find();

  RxList<Cars> cars = <Cars>[].obs;
  var car = Cars().obs;
  var itemCount = 0.obs;
  TextEditingController nameCtr = TextEditingController();
  TextEditingController modelCtr = TextEditingController();
  TextEditingController colorCtr = TextEditingController();
  TextEditingController yearCtr = TextEditingController();
  TextEditingController vinCtr = TextEditingController();
  TextEditingController priceCtr = TextEditingController();
  TextEditingController availCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getVehicle();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.loading());
  }

  @override
  void onClose() {}

  controllerValueAssign() {
    nameCtr.text = car.value.car!;
    modelCtr.text = car.value.carModel!;
    yearCtr.text = car.value.carModelYear!.toString();
    priceCtr.text = car.value.price!;
    vinCtr.text = car.value.carVin!;
    colorCtr.text = car.value.carColor!;
    availCtr.text = car.value.availability!.toString();
  }

  getVehicle() {
    _apiProvider.getVehicles().then((value) {
      if (value.isOk) {
        Vehicles _data = Vehicles.fromJson(value.body);
        if (_data.cars!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          cars.addAll(_data.cars!);
          car.value = cars.first;
          change(cars.first, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error('Something went wrong'));
      }
    });
  }

  onForwordPressed() {
    print('FORWARD PRESSED');

    if (itemCount.value < cars.length - 1) {
      itemCount++;
    } else {
      itemCount.value = 0;
    }
    car.value = cars[itemCount.value];
    change(car.value, status: RxStatus.success());
    print(car.value.car!);
    print(itemCount.value);
  }

  onBackwardPressed() {
    print('BACK PRESSED');
    if (itemCount.value > 0) {
      itemCount.value--;
    } else {
      itemCount.value = cars.length - 1;
    }
    car.value = cars[itemCount.value];
    change(car.value, status: RxStatus.success());
  }

  onDeletePressed() {
    // if(itemCount)
    print(itemCount.value);
    print(cars.length);
    cars.removeAt(itemCount.value);
    if (itemCount.value == 0) {
      itemCount.value =cars.length-1;
    }else{
      itemCount--;
    }
    car.value = cars[itemCount.value];

    change(car.value, status: RxStatus.success());
  }

  onSavedPressed() {
    car.value.car = nameCtr.text;
    car.value.carModel = modelCtr.text;
    car.value.price = priceCtr.text;
    car.value.carModelYear = yearCtr.text;
    car.value.carVin = vinCtr.text;
    car.value.carColor = colorCtr.text;
    car.value.availability = availCtr.text;

    cars.removeAt(itemCount.value);
    cars.insert(itemCount.value, car.value);
    change(car.value, status: RxStatus.success());
    Get.back();
  }

  onEditPressed() {
    controllerValueAssign();
    Get.toNamed(Routes.EDIT_VEHICLE);
  }
}
