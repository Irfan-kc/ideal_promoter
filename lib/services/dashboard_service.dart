import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'dashboard_service.chopper.dart';

@ChopperApi()
abstract class DashboardService extends ChopperService {
  @Get(path: 'static/promoter/dashboard/data')
  Future<Response<dynamic>> dashboardData();

  static DashboardService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$DashboardService(),
      ],
      converter: const JsonConverter(),
    );
    return _$DashboardService(client);
  }
}
