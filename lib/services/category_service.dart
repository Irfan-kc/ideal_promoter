import 'package:chopper/chopper.dart';


@ChopperApi()
abstract class CategoryService extends ChopperService {
  @Get(path: 'category/user/all')
  Future<Response<dynamic>> getCategories();
}
