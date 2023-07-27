import 'package:ideal_promoter/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> choppers = [
  Provider(
    create: (context) => AuthService.create(),
    dispose: (_, AuthService service) => service.client.dispose(),
  ),
];
