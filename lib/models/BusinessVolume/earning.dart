class Earning {
  String? id;
  int? orderAmount;
  double? promoterAmount;

  Earning({this.id, this.orderAmount, this.promoterAmount});

  factory Earning.fromJson(Map<String, dynamic> json) => Earning(
        id: json['_id'] as String?,
        orderAmount: json['orderAmount'] as int?,
        promoterAmount: (json['promoterAmount'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'orderAmount': orderAmount,
        'promoterAmount': promoterAmount,
      };
}
