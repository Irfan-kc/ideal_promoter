import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ErrorInterceptor implements ResponseInterceptor {
  @override
  FutureOr<Response<dynamic>> onResponse(Response<dynamic> response) async {
    switch (response.statusCode) {
      case 200:
        return response;
      case 401:
        var sharedPreference = await SharedPreferences.getInstance();
        sharedPreference.remove('token');
        return response;
      default:
        return response;
    }
  }
}
