import 'image.dart';
import 'primary_lang.dart';
import 'secondary_lang.dart';
import 'varient.dart';

class Product {
  PrimaryLang? primaryLang;
  SecondaryLang? secondaryLang;
  String? id;
  String? itemCode;
  String? barcode;
  List<String>? keywords;
  bool? hasVarients;
  List<Varient>? varients;
  List<dynamic>? categories;
  bool? isDailyProduct;
  bool? isSpecialOffer;
  bool? isBulkyProduct;
  bool? isExtraChargeNeeded;
  int? extraCharge;
  List<dynamic>? availableAreas;
  bool? isAvailableEveryWhere;
  bool? isFittingNeeded;
  bool? isFitted;
  int? fittingCharge;
  bool? isReturnViable;
  bool? isFeatured;
  List<dynamic>? extras;
  double? cost;
  double? price;
  double? offerPrice;
  double? primePrice;
  int? stock;
  int? minStock;
  int? reorderQuantity;
  bool? isActive;
  bool? isDeleted;
  int? commisionPercentage;
  List<ProductImage>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic maxOrderQuantity;
  dynamic minOrderQuantity;
  String? user;
  String? availableTimeFrom;
  String? availableTimeTo;

  Product({
    this.primaryLang,
    this.secondaryLang,
    this.id,
    this.itemCode,
    this.barcode,
    this.keywords,
    this.hasVarients,
    this.varients,
    this.categories,
    this.isDailyProduct,
    this.isSpecialOffer,
    this.isBulkyProduct,
    this.isExtraChargeNeeded,
    this.extraCharge,
    this.availableAreas,
    this.isAvailableEveryWhere,
    this.isFittingNeeded,
    this.isFitted,
    this.fittingCharge,
    this.isReturnViable,
    this.isFeatured,
    this.extras,
    this.cost,
    this.price,
    this.offerPrice,
    this.primePrice,
    this.stock,
    this.minStock,
    this.reorderQuantity,
    this.isActive,
    this.isDeleted,
    this.commisionPercentage,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.maxOrderQuantity,
    this.minOrderQuantity,
    this.user,
    this.availableTimeFrom,
    this.availableTimeTo,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        primaryLang: json['primaryLang'] == null
            ? null
            : PrimaryLang.fromJson(json['primaryLang'] as Map<String, dynamic>),
        secondaryLang: json['secondaryLang'] == null
            ? null
            : SecondaryLang.fromJson(
                json['secondaryLang'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        itemCode: json['itemCode'] as String?,
        barcode: json['barcode'] as String?,
        // keywords: json['keywords'] as List<String>?,
        hasVarients: json['hasVarients'] as bool?,
        varients: (json['varients'] as List<dynamic>?)
            ?.map((e) => Varient.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories: json['categories'] as List<dynamic>?,
        isDailyProduct: json['isDailyProduct'] as bool?,
        isSpecialOffer: json['isSpecialOffer'] as bool?,
        isBulkyProduct: json['isBulkyProduct'] as bool?,
        isExtraChargeNeeded: json['isExtraChargeNeeded'] as bool?,
        extraCharge: json['extraCharge'] as int?,
        availableAreas: json['availableAreas'] as List<dynamic>?,
        isAvailableEveryWhere: json['isAvailableEveryWhere'] as bool?,
        isFittingNeeded: json['isFittingNeeded'] as bool?,
        isFitted: json['isFitted'] as bool?,
        fittingCharge: json['fittingCharge'] as int?,
        isReturnViable: json['isReturnViable'] as bool?,
        isFeatured: json['isFeatured'] as bool?,
        extras: json['extras'] as List<dynamic>?,
        cost: json['cost'] as double?,
        price: json['price'] as double?,
        offerPrice: json['offerPrice'] as double?,
        primePrice: json['primePrice'] as double?,
        stock: json['stock'] as int?,
        minStock: json['minStock'] as int?,
        reorderQuantity: json['reorderQuantity'] as int?,
        isActive: json['isActive'] as bool?,
        isDeleted: json['isDeleted'] as bool?,
        commisionPercentage: json['commisionPercentage'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        maxOrderQuantity: json['maxOrderQuantity'] as dynamic,
        minOrderQuantity: json['minOrderQuantity'] as dynamic,
        user: json['user'] as String?,
        availableTimeFrom: json['availableTimeFrom'] as String?,
        availableTimeTo: json['availableTimeTo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'primaryLang': primaryLang?.toJson(),
        'secondaryLang': secondaryLang?.toJson(),
        '_id': id,
        'itemCode': itemCode,
        'barcode': barcode,
        'keywords': keywords,
        'hasVarients': hasVarients,
        'varients': varients?.map((e) => e.toJson()).toList(),
        'categories': categories,
        'isDailyProduct': isDailyProduct,
        'isSpecialOffer': isSpecialOffer,
        'isBulkyProduct': isBulkyProduct,
        'isExtraChargeNeeded': isExtraChargeNeeded,
        'extraCharge': extraCharge,
        'availableAreas': availableAreas,
        'isAvailableEveryWhere': isAvailableEveryWhere,
        'isFittingNeeded': isFittingNeeded,
        'isFitted': isFitted,
        'fittingCharge': fittingCharge,
        'isReturnViable': isReturnViable,
        'isFeatured': isFeatured,
        'extras': extras,
        'cost': cost,
        'price': price,
        'offerPrice': offerPrice,
        'primePrice': primePrice,
        'stock': stock,
        'minStock': minStock,
        'reorderQuantity': reorderQuantity,
        'isActive': isActive,
        'isDeleted': isDeleted,
        'commisionPercentage': commisionPercentage,
        'images': images?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'maxOrderQuantity': maxOrderQuantity,
        'minOrderQuantity': minOrderQuantity,
        'user': user,
        'availableTimeFrom': availableTimeFrom,
        'availableTimeTo': availableTimeTo,
      };
}
