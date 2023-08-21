import 'earning.dart';
import 'promoter.dart';

class BusinessVolume {
  String? id;
  Promoter? promoter;
  String? refId;
  Earning? earning;
  double? amount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BusinessVolume({
    this.id,
    this.promoter,
    this.refId,
    this.earning,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BusinessVolume.fromJson(Map<String, dynamic> json) {
    return BusinessVolume(
      id: json['_id'] as String?,
      promoter: json['promoter'] == null
          ? null
          : Promoter.fromJson(json['promoter'] as Map<String, dynamic>),
      refId: json['ref_id'] as String?,
      earning: json['earning'] == null
          ? null
          : Earning.fromJson(json['earning'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'promoter': promoter?.toJson(),
        'ref_id': refId,
        'earning': earning?.toJson(),
        'amount': amount,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
