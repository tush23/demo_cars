import 'package:get/get.dart';

import 'package:demo_cars/app/modules/vehicles/views/edit_vehicle_view.dart';
import 'package:demo_cars/app/modules/home/bindings/home_binding.dart';
import 'package:demo_cars/app/modules/home/views/home_view.dart';
import 'package:demo_cars/app/modules/vehicles/bindings/vehicles_binding.dart';
import 'package:demo_cars/app/modules/vehicles/views/vehicles_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLES,
      page: () => VehiclesView(),
      binding: VehiclesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_VEHICLE,
      page: () => EditVehicleView(),
    ),
  ];
}
