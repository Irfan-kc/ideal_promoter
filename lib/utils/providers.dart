import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:ideal_promoter/Provider/signup_page/signup_page_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: SignUpPageProvider(),
  ),
];
  