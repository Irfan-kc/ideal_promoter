import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'product_service.chopper.dart';

@ChopperApi()
abstract class ProductService extends ChopperService {
  @Get(path: 'product/promoter/all')
  Future<Response<dynamic>> getAllProducts({
    @Query('page') int? page,
    @Query('search') String? search,
  });

  @Get(path: 'product/promoter/custom/featured')
  Future<Response<dynamic>> getFeaturedProducts({
    @Query('page') int? page,
  });

  @Get(path: 'product/promoter/single/{productId}')
  Future<Response<dynamic>> getProduct(
      {@Path('productId') required String productId});

  @Get(path: 'product/user/category/{category_id}')
  Future<Response<dynamic>> getProductByCategory({
    @Path('category_id') required String categoryId,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  static ProductService create() {
    final client = ChopperClient(
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
        ErrorInterceptor(),
      ],
      baseUrl: Uri.parse(FlavorConfig.values.baseUrlApi),
      services: [
        _$ProductService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ProductService(client);
  }
}
