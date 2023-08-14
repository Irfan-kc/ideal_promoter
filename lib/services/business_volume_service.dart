import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'business_volume_service.chopper.dart';

@ChopperApi()
abstract class BusinessVolumeService extends ChopperService {
  @Get(path: 'business-volume/promoter/all')
  Future<Response<dynamic>> getBusinessVolume({
    @Query('from') String? fromDate,
    @Query('to') String? toDate,
    @Query('page') int? page,
  });

  static BusinessVolumeService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$BusinessVolumeService(),
      ],
      converter: const JsonConverter(),
    );
    return _$BusinessVolumeService(client);
  }
}
