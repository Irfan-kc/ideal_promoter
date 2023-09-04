import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Category/category.dart';
import 'package:ideal_promoter/models/Category/category_response.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoryProvider extends BaseProvider {
  List<CategoryModel> allCategoryList = [];
  List<CategoryModel> allSubCategoryList = [];
  List<CategoryModel> allMainCategoryList = [];
  List<CategoryModel> subCatListByMainCat = [];
  String? selectedSubCatId;

  bool isLoading = false;

  changeIsSelectSub(BuildContext context, int index) {
    for (var i = 0; i < subCatListByMainCat.length; i++) {
      if (index == -1) {
        subCatListByMainCat[i].isSelected = false;
      } else if (index == i) {
        subCatListByMainCat[i].isSelected = true;
      } else {
        subCatListByMainCat[i].isSelected = false;
      }
    }
    if (index != -1) {
      Provider.of<ProductProvider>(context, listen: false)
          .getAllProductsByCategory(context, subCatListByMainCat[index].id!, 1);
    }
  }

  changeIsSelect(BuildContext context, int index, String catId) {
    for (var i = 0; i < allCategoryList.length; i++) {
      if (index == i) {
        allCategoryList[i].isSelected = true;
        notifyListeners();
      } else {
        allCategoryList[i].isSelected = false;
        notifyListeners();
      }
    }
    getSubcategoryByMainCategory(catId);
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductsByCategory(context, allCategoryList[index].id!, 1);
    changeIsSelectSub(context, -1);
  }

  clearSubCategoryList() {
    subCatListByMainCat.clear();
    notifyListeners();
  }

  getSubcategoryByMainCategory(String catId) async {
    subCatListByMainCat.clear();
    for (var subCat in allSubCategoryList) {
      if (catId == subCat.mainCategory!.id!) {
        subCatListByMainCat.add(subCat);
        notifyListeners();
      }
    }
  }

  Future getAllCategories(BuildContext context) async {
    try {
      allCategoryList.clear();
      var response = await Provider.of<CategoryService>(context, listen: false)
          .allCategories();
      if (response.isSuccessful) {
        CategoryResponse responses = CategoryResponse.fromJson(response.body);
        allCategoryList = responses.allCategories!;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getAllSubCategories(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      allSubCategoryList.clear();
      var response = await Provider.of<CategoryService>(context, listen: false)
          .subCategories();
      if (response.isSuccessful) {
        CategoryResponse responses = CategoryResponse.fromJson(response.body);
        allSubCategoryList = responses.allCategories!;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getAllMainCategories(BuildContext context) async {
    try {
      allMainCategoryList.clear();
      var response = await Provider.of<CategoryService>(context, listen: false)
          .mainCategories();
      if (response.isSuccessful) {
        CategoryResponse responses = CategoryResponse.fromJson(response.body);
        allMainCategoryList = responses.allCategories!;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
