import 'package:chopper/chopper.dart';
import 'package:ideal_promoter/config/flavor_config.dart';
import 'package:ideal_promoter/interceptors/error_interceptors.dart';
import 'package:ideal_promoter/interceptors/header_interceptor.dart';
part 'product_service.chopper.dart';

@ChopperApi()
abstract class ProductService extends ChopperService {
  @Get(path: 'product/promoter/custom/featured')
  Future<Response<dynamic>> getAllProducts();
  
  @Get(path: 'product/promoter/single/{productId}')
  Future<Response<dynamic>> getProduct(
    {@Path('productId') required String productId}
  );

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
