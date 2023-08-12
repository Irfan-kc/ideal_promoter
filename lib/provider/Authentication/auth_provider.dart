// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/auth_service.dart';
import 'package:ideal_promoter/view/screen/home/home.dart';
import 'package:ideal_promoter/view/widget/snackbars/error_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/login/login_screen.dart';
import '../../view/widget/snackbars/success_snackbar.dart';

class AuthProvider extends BaseProvider {
  bool isLoading = false;
  bool isSigned = false;

  String? email;
  String? password;

  AuthProvider() {
    signInCheck();
  }

  Future login(BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      var response = await Provider.of<AuthService>(context, listen: false)
          .login(body: body);
      if (response.isSuccessful) {
        if (await setToken(response.body["token"])) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Home(),
            ),
          );
        } else {
          await errorSnackBar(
              message: "Something went wrong!", context: context);
        }
      } else {
        await errorSnackBar(
            message: response.error.toString().split('"')[3], context: context);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future signup(BuildContext context, String name, String number, String mail,
      String password, String confirm) async {
    try {
      isLoading = true;
      notifyListeners();
      Map<String, dynamic> body = {
        "name": name,
        "phone": number,
        "email": mail,
        "password": password,
        "confirmPassword": confirm
      };
      if (password == confirm) {
        var response = await Provider.of<AuthService>(context, listen: false)
            .signup(body: body);
        if (response.isSuccessful) {
          await successSnackBar(
              message:
                  'Successfully registered as promoter, Please wait for the approval',
              context: context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
          );
        } else {
          await errorSnackBar(
              message: response.error.toString().split('"')[3],
              context: context);
        }
      } else {
        errorSnackBar(message: 'Password miss match', context: context);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future reset(BuildContext context, String email) async {
    try {
      isLoading = true;
      Map<String, dynamic> body = {"email": email, "password": ""};
      var response = await Provider.of<AuthService>(context, listen: false)
          .passwordReset(body: body);
      if (response.isSuccessful) {
        successSnackBar(message: response.body['message'], context: context);
        Navigator.pop(context);
      } else {
        await errorSnackBar(
            message: response.error.toString().split('"')[3], context: context);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future logout(BuildContext context) async {
    try {
      isLoading = true;
      Map<String, dynamic> body = {"email": email, "password": password};
      var response = await Provider.of<AuthService>(context, listen: false)
          .logout(body: body);
      if (response.isSuccessful) {
        clearToken();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (route) => false);
      } else {
        await errorSnackBar(
            message: response.error.toString().split('"')[3], context: context);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  signInCheck() async {
    var sharedPref = await SharedPreferences.getInstance();
    isSigned = sharedPref.containsKey("token");
  }

  Future<bool> setToken(String? token) async {
    if (token == null) return false;
    var sharedPref = await SharedPreferences.getInstance();
    return await sharedPref.setString("token", token);
  }

  Future<bool> clearToken() async {
    var sharedPref = await SharedPreferences.getInstance();
    return await sharedPref.remove("token");
  }
}
