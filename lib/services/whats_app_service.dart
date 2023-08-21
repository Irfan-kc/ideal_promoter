import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'whats_app_service.chopper.dart';

@ChopperApi()
abstract class WhatsAppService extends ChopperService {
  @Post(path: 'whatsapp-api/broadcast/product/{id}')
  Future<Response<dynamic>> getItOnWhatsApp({@Path('id') required String id});

  static WhatsAppService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$WhatsAppService(),
      ],
      converter: const JsonConverter(),
    );
    return _$WhatsAppService(client);
  }
}
