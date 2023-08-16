import 'earnings.dart';

class EarningsModel {
  List<Earnings>? earnings;
  double? totalEarningsAmount;
  double? totalOrderEarningsAmount;
  int? totalBvEarningsAmount;
  int? total;
  String? page;

  EarningsModel({
    this.earnings,
    this.totalEarningsAmount,
    this.totalOrderEarningsAmount,
    this.totalBvEarningsAmount,
    this.total,
    this.page,
  });

  factory EarningsModel.fromJson(Map<String, dynamic> json) => EarningsModel(
        earnings: (json['earnings'] as List<dynamic>?)
            ?.map((e) => Earnings.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalEarningsAmount: (json['totalEarningsAmount'] as num?)?.toDouble(),
        totalOrderEarningsAmount:
            (json['totalOrderEarningsAmount'] as num?)?.toDouble(),
        totalBvEarningsAmount: json['totalBVEarningsAmount'] as int?,
        total: json['total'] as int?,
        page: json['page'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'earnings': earnings?.map((e) => e.toJson()).toList(),
        'totalEarningsAmount': totalEarningsAmount,
        'totalOrderEarningsAmount': totalOrderEarningsAmount,
        'totalBVEarningsAmount': totalBvEarningsAmount,
        'total': total,
        'page': page,
      };
}
