import 'package:ideal_promoter/models/Earnings/order.dart';

class Earnings {
  String? id;
  String? promoter;
  String? refId;
  Order? order;
  int? orderAmount;
  double? promoterAmount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? type;

  Earnings({
    this.id,
    this.promoter,
    this.refId,
    this.order,
    this.orderAmount,
    this.promoterAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.type,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) => Earnings(
        id: json['_id'] as String?,
        promoter: json['promoter'] as String?,
        refId: json['ref_id'] as String?,
        order: json['order'] == null
            ? null
            : Order.fromJson(json['order'] as Map<String, dynamic>),
        orderAmount: json['orderAmount'] as int?,
        promoterAmount: (json['promoterAmount'] as num?)?.toDouble(),
        status: json['status'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'promoter': promoter,
        'ref_id': refId,
        'order': order,
        'orderAmount': orderAmount,
        'promoterAmount': promoterAmount,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'type': type,
      };
}
