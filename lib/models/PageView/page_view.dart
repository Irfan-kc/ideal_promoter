import 'product.dart';

class PageViews {
  String? id;
  Product? product;
  String? promoter;
  String? refId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PageViews({
    this.id,
    this.product,
    this.promoter,
    this.refId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PageViews.fromJson(Map<String, dynamic> json) => PageViews(
        id: json['_id'] as String?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        promoter: json['promoter'] as String?,
        refId: json['ref_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'product': product?.toJson(),
        'promoter': promoter,
        'ref_id': refId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
