import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'profile_service.chopper.dart';

@ChopperApi()
abstract class ProfileService extends ChopperService {
  @Get(path: 'promoter')
  Future<Response<dynamic>> getProfile();

  @Put(path: 'promoter')
  Future<Response<dynamic>> updateProfile({
    @Body() required Map<String, dynamic> body,
  });

  static ProfileService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$ProfileService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ProfileService(client);
  }
}
