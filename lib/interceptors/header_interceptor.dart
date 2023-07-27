import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String authHeader = "Authorization";
  static const String role = "Role";
  static const String tokens = "Bearer ";

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token != null) {
      return '$tokens$token';
    }
    return '';
  }

  @override
  FutureOr<Request> onRequest(Request request) async {
    String token = await getToken();

    Request newRequest = request.copyWith(headers: {
      authHeader: token,
      "Content-Type": "application/json",
    });
    return newRequest;
  }
}
