import 'product.dart';

class FeaturedProducts {
  List<Product>? products;
  int? total;

  FeaturedProducts({this.products, this.total});

  factory FeaturedProducts.fromJson(Map<String, dynamic> json) {
    return FeaturedProducts(
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
