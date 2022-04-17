import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiHandler {
  static final ApiHandler _singleton = ApiHandler._internal();

  factory ApiHandler() {
    return _singleton;
  }

  ApiHandler._internal();

  Future<dynamic> loading() => showDialog(
        barrierDismissible: false,
        builder: (ctx) => Center(
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                width: 60,
                height: 60,
                child: const CircularProgressIndicator(
                    strokeWidth: 1.5,
                    semanticsLabel: "Loading",
                    valueColor:
                         AlwaysStoppedAnimation<Color>(Colors.blue)))),
        context: Get.context as BuildContext,
      );

  Widget progressIndicator()=>const Center(
    child: CircularProgressIndicator(
        strokeWidth: 1.5,
        semanticsLabel: "Loading",
        valueColor:
        AlwaysStoppedAnimation<Color>(Colors.blue)),
  );
  Widget emptyWidget()=>Center(child: Text('No Data Found',style: Get.textTheme.headline5,));
}
