import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'page_views_service.chopper.dart';

@ChopperApi()
abstract class PageViewService extends ChopperService {
  @Get(path: 'page-view/promoter/all')
  Future<Response<dynamic>> pageViewData({
    @Query('page') int? page,
  });

  static PageViewService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$PageViewService(),
      ],
      converter: const JsonConverter(),
    );
    return _$PageViewService(client);
  }
}
