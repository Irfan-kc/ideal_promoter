import 'package:flutter/cupertino.dart';

class SignUpPageProvider extends ChangeNotifier {
  String countryCode = '+91 ';

  bool isFocused = false;

  void setFocused(bool focused) {
    isFocused = focused;
    notifyListeners();
  }

  onRefresh() {
    notifyListeners();
  }
}
