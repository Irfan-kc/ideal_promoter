import 'package:flutter/material.dart';

class ProfileScreenProvider extends ChangeNotifier {
  bool readOnly = true;

  onRefresh() {
    notifyListeners();
  }
}
