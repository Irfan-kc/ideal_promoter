import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:ideal_promoter/Provider/signup_page/signup_page_provider.dart';

import '../provider/dashboard_provider/dashboard_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: SignUpPageProvider(),
  ),
  ChangeNotifierProvider.value(
    value: BaseProvider(),
  ),
  ChangeNotifierProvider.value(
    value: AuthProvider(),
  ),
  ChangeNotifierProvider.value(
    value: DashboardProvider(),
  ),
];
