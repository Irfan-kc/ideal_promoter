import 'product.dart';

class ProductModel {
  List<Product>? products;
  int? total;

  ProductModel({this.products, this.total});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
      };
}
