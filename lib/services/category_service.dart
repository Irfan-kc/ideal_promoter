import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'category_service.chopper.dart';

@ChopperApi()
abstract class CategoryService extends ChopperService {
  @Get(path: 'category/user/custom/all')
  Future<Response<dynamic>> allCategories();

  @Get(path: 'category/user/custom/sub')
  Future<Response<dynamic>> subCategories();

  @Get(path: 'category/user/custom/main')
  Future<Response<dynamic>> mainCategories();

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
