import 'image.dart';
import 'primary_lang.dart';
import 'secondary_lang.dart';
import 'varient.dart';

class Product {
  PageViewPrimaryLang? primaryLang;
  PageViewSecondaryLang? secondaryLang;
  String? id;
  List<PageViewImage>? images;
  bool? hasVarients;
  List<PageViewVarient>? varients;
  double? price;
  double? offerPrice;
  double? stock;

  Product({
    this.primaryLang,
    this.secondaryLang,
    this.id,
    this.images,
    this.hasVarients,
    this.varients,
    this.price,
    this.offerPrice,
    this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        primaryLang: json['primaryLang'] == null
            ? null
            : PageViewPrimaryLang.fromJson(
                json['primaryLang'] as Map<String, dynamic>),
        secondaryLang: json['secondaryLang'] == null
            ? null
            : PageViewSecondaryLang.fromJson(
                json['secondaryLang'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => PageViewImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        hasVarients: json['hasVarients'] as bool?,
        varients: (json['varients'] as List<dynamic>?)
            ?.map((e) => PageViewVarient.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: double.parse(json['price'].toString()),
        offerPrice: double.parse(json['offerPrice'].toString()),
        stock: double.parse(json['stock'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'primaryLang': primaryLang?.toJson(),
        'secondaryLang': secondaryLang?.toJson(),
        '_id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'hasVarients': hasVarients,
        'varients': varients?.map((e) => e.toJson()).toList(),
        'price': price,
        'offerPrice': offerPrice,
        'stock': stock,
      };
}
