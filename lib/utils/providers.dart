import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/provider/BusinessVolume/business_volume_provider.dart';
import 'package:ideal_promoter/provider/Category/category_provider.dart';
import 'package:ideal_promoter/provider/Graph/graph_provider.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/provider/SignupPage/signup_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/Dashboard/dashboard_provider.dart';

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
  ChangeNotifierProvider.value(
    value: CategoryProvider(),
  ),
  ChangeNotifierProvider.value(
    value: GraphProvider(),
  ),
  ChangeNotifierProvider.value(
    value: ProductProvider(),
  ),
  ChangeNotifierProvider.value(
    value: BusinessVolumeProvider(),
  ),
];
