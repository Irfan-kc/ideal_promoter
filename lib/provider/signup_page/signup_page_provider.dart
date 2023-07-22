import 'package:flutter/cupertino.dart';

class SignUpPageProvider extends ChangeNotifier {
  String countryCode = '+91 ';

  onRefresh() {
    notifyListeners();
  }
}
