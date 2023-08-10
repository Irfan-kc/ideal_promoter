import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Category/category.dart';
import 'package:ideal_promoter/models/Category/category_response.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoryProvider extends BaseProvider {
  bool isLoading = false;
  List<CategoryModel> categories = [];

  Future getAllCategories(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<CategoryService>(context, listen: false)
          .getCategories();
      if (response.isSuccessful) {
        var result = CategoryResponse.fromJson(response.body);
        categories = result.allCategories ?? [];
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
