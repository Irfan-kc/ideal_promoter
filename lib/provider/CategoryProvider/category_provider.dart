import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoryProvider extends BaseProvider {
  bool isLoading = false;
  

  Future getAllCategories(BuildContext context) async {
    try {
      isLoading = true;
      var response = await Provider.of<CategoryService>(context, listen: false).getCategories();
      if (response.isSuccessful) {
        
        
      }
    } catch (e) {}
  }
}
