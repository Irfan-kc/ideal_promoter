import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Products/product_model.dart.dart';
import 'package:ideal_promoter/models/Products/product.dart';
import 'package:ideal_promoter/models/SingleProduct/single_product_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/product_service.dart';
import 'package:provider/provider.dart';

class ProductProvider extends BaseProvider {
  bool isLoading = false;
  bool isSingleProductLoading = false;
  List<Product> allProducts = [];
  List<Product> featuredProducts = [];
  SingleProductModel? singleProduct;
  bool isProductPagination = true;
  String? selectedCatId;

  Future doPagination(BuildContext context, {int? page}) async {
    if (isProductPagination) {
      await getAllProducts(context, page: page);
    } else {
      await getAllProductsByCategory(context, selectedCatId!, page!);
    }
  }

  Future getAllProducts(BuildContext context, {int? page}) async {
    try {
      isProductPagination = true;
      if (page == null || page == 1) {
        allProducts.clear();
        isLoading = true;
        notifyListeners();
      }
      var response = await Provider.of<ProductService>(context, listen: false)
          .getAllProducts(page: page);
      if (response.isSuccessful) {
        var result = ProductModel.fromJson(response.body);
        allProducts.addAll(result.products ?? []);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getAllProductsByCategory(
    BuildContext context,
    String catId,
    int page,
  ) async {
    selectedCatId = catId;
    isProductPagination = false;
    try {
      if (page == 1) {
        isLoading = true;
        allProducts.clear();
        notifyListeners();
      }
      var response = await Provider.of<ProductService>(context, listen: false)
          .getProductByCategory(
        categoryId: catId,
        page: page,
        limit: 20,
      );
      if (response.isSuccessful) {
        var result = ProductModel.fromJson(response.body);
        allProducts.addAll(result.products ?? []);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getAllFeaturedProducts(BuildContext context, {int? page}) async {
    try {
      isLoading = true;
      notifyListeners();
      if (page == null || page == 1) {
        featuredProducts.clear();
      }
      var response = await Provider.of<ProductService>(context, listen: false)
          .getFeaturedProducts(page: page);
      if (response.isSuccessful) {
        var result = ProductModel.fromJson(response.body);
        featuredProducts.addAll(result.products ?? []);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getProduct(BuildContext context, String id) async {
    try {
      isSingleProductLoading = true;
      notifyListeners();
      var response = await Provider.of<ProductService>(context, listen: false)
          .getProduct(productId: id);
      if (response.isSuccessful) {
        singleProduct = SingleProductModel.fromJson(response.body);
      }
    } catch (e) {
      rethrow;
    } finally {
      isSingleProductLoading = false;
      notifyListeners();
    }
  }
}
