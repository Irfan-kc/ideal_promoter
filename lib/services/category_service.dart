import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'category_service.chopper.dart';

@ChopperApi()
abstract class CategoryService extends ChopperService {
  @Get(path: 'category/user/all')
  Future<Response<dynamic>> getCategories();

  static CategoryService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$CategoryService(),
      ],
      converter: const JsonConverter(),
    );
    return _$CategoryService(client);
  }
}
