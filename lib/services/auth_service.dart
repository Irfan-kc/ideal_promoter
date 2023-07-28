import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  @Post(path: 'login/mail')
  Future<Response<dynamic>> login({@Body() required Map<String, dynamic> body});

  @Post(path: 'promoter/form/new')
  Future<Response<dynamic>> signup(
      {@Body() required Map<String, dynamic> body});

  static AuthService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$AuthService(),
      ],
      converter: const JsonConverter(),
    );
    return _$AuthService(client);
  }
}
