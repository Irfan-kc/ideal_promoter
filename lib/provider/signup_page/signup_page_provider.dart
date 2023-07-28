import 'package:flutter/cupertino.dart';

class SignUpPageProvider extends ChangeNotifier {


  String country = '+91';

  onRefresh() {
    notifyListeners();
  }

}
