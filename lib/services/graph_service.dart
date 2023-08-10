import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'graph_service.chopper.dart';

@ChopperApi()
abstract class GraphService extends ChopperService {
  @Get(path: 'earning/promoter/monthly/all')
  Future<Response<dynamic>> getAllraphData();

  static GraphService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$GraphService(),
      ],
      converter: const JsonConverter(),
    );
    return _$GraphService(client);
  }
}
