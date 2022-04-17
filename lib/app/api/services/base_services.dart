import 'package:get/get_connect/http/src/response/response.dart';

abstract class BaseApiServices {

  Future<Response> getVehicles();
  // Future<Response> helpDesk(Map<String, String> requestMap);
}
