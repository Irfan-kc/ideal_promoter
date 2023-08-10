import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Products/featured_products.dart';
import 'package:ideal_promoter/models/Products/product.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/product_service.dart';
import 'package:provider/provider.dart';

class ProductProvider extends BaseProvider {
  bool isLoading = false;
  List<Product> products = [];

  Future getAllProducts(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<ProductService>(context, listen: false)
          .getProducts();
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
}
