import 'dart:convert';

import 'package:http/http.dart';

import 'package:apitask/src/pages/apiresponse.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper.internal();

  factory ApiHelper() => _instance;
  ApiHelper.internal();
  static const _BASE_URL = "https://saurav.tech/";

  Future<ApiResponse> getRequest(String route) async {
    String url = _BASE_URL + route;
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        return ApiResponse();
      }
    } catch (ex) {
      return ApiResponse();
    }
  }
}