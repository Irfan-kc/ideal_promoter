import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Products/featured_products.dart';
import 'package:ideal_promoter/models/Products/product.dart';
import 'package:ideal_promoter/models/SingleProduct/single_product_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/product_service.dart';
import 'package:provider/provider.dart';

class ProductProvider extends BaseProvider {
  bool isLoading = false;
  bool isSingleProductLoading = false;
  List<Product> products = [];
  SingleProductModel? singleProduct;

  Future getAllProducts(BuildContext context, {int? page}) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<ProductService>(context, listen: false)
          .getAllProducts(page: page);
      if (response.isSuccessful) {
        var result = FeaturedProducts.fromJson(response.body);
        products = result.products ?? [];
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
