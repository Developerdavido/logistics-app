
import 'package:dio/dio.dart';

import '../res/api_strings.dart';
import 'https_service.dart';

class AddressServices extends HttpService{



  //check if it a successful response
  successfulResponse(Response response) {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }



  //get the address details
  Future<Response> getAddressDetails({String? addressDetails}) async {
    var response = await get("${Api.address}$addressDetails");
    return response;
  }
}