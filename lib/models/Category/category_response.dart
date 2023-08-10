import 'package:ideal_promoter/models/Category/category.dart';

class CategoryResponse {
  List<CategoryModel>? allCategories;

  CategoryResponse({
    this.allCategories,
  });

  factory CategoryResponse.fromJson(List<dynamic> json) {
    // log(json.length.toString());
    return CategoryResponse(
      allCategories: (json).map((e) => CategoryModel.fromJson(e)).toList(),
    );
  }
}
