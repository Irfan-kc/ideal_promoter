import 'package:flutter/cupertino.dart';

class SignUpPageProvider extends ChangeNotifier {
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode numberFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();

  String countryCode = '+91 ';

  onRefresh() {
    notifyListeners();
  }
}
