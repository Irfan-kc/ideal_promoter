import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'earnings_service.chopper.dart';

@ChopperApi()
abstract class EarningsService extends ChopperService {
  @Get(path: 'earning/promoter/all')
  Future<Response<dynamic>> earningsData({
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('page') int? page,
  });

  static EarningsService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$EarningsService(),
      ],
      converter: const JsonConverter(),
    );
    return _$EarningsService(client);
  }
}
