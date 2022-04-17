import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/api/provider/api_provider.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put<ApiProvider>(
    ApiProvider(),
  );
  runZonedGuarded((){
    runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }, (dynamic error, StackTrace stackTrace) {
    print('<<----------ERROR--------->> \n$error $stackTrace');
    Get.defaultDialog(
        title: 'Error',
        middleText: 'Something went wrong please contact admin!',
        barrierDismissible: true);
  },);


}
