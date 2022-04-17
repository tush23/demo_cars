
import 'package:demo_cars/app/api/constants/api_constants.dart';
import 'package:demo_cars/app/api/services/base_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';


class ApiProvider extends GetConnect with BaseApiServices {
  static const String _BASE_URL = 'https://myfakeapi.com/api/';

  @override
  void onInit() {
    httpClient.baseUrl = _BASE_URL;
    httpClient.timeout = const Duration(seconds: 5);
    httpClient.errorSafety = true;
    // adding RequestModifier.
    // addRequestModifier();
    // httpClient.
    // httpClient.addResponseModifier((request, response) {
    //   // request.headers['x-api-key'] = _X_API_KEY;
    //   // request.headers['Authorization'] = USER_TOKEN.value;
    //   debugPrint(
    //     '\n╔══════════════════════════ Response ══════════════════════════\n'
    //     '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
    //     '╟ url: ${request.url}\n'
    //     '╟ Headers: ${request.headers}\n'
    //     '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString())}\n'
    //     '╟ Status Code: ${response.statusCode}\n'
    //     '╟ Data: ${response.bodyString?.toString() ?? ''}'
    //     '\n╚══════════════════════════ Response ══════════════════════════\n',
    //     wrapWidth: 1024,
    //   );
    //   return request;
    // });
  }


  @override
  Future<Response> getVehicles()async {
    var response=await get(API_GET_CARS);
    return response;
  }
}
