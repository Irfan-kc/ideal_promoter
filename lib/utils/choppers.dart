import 'package:ideal_promoter/services/auth_service.dart';
import 'package:ideal_promoter/services/business_volume_service.dart';
import 'package:ideal_promoter/services/category_service.dart';
import 'package:ideal_promoter/services/dashboard_service.dart';
import 'package:ideal_promoter/services/graph_service.dart';
import 'package:ideal_promoter/services/product_service.dart';
import 'package:ideal_promoter/services/profile_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> choppers = [
  Provider(
    create: (context) => AuthService.create(),
    dispose: (_, AuthService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => DashboardService.create(),
    dispose: (_, DashboardService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => CategoryService.create(),
    dispose: (_, CategoryService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => GraphService.create(),
    dispose: (_, GraphService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => ProductService.create(),
    dispose: (_, ProductService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => BusinessVolumeService.create(),
    dispose: (_, BusinessVolumeService service) => service.client.dispose(),
  ),
  Provider(
    create: (context) => ProfileService.create(),
    dispose: (_, ProfileService service) => service.client.dispose(),
  ),
];
