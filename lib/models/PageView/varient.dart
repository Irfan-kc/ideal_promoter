class PageViewVarient {
  String? value;
  String? unit;
  double? cost;
  double? price;
  double? offerPrice;
  double? primePrice;
  double? stock;
  String? id;

  PageViewVarient({
    this.value,
    this.unit,
    this.cost,
    this.price,
    this.offerPrice,
    this.primePrice,
    this.stock,
    this.id,
  });

  factory PageViewVarient.fromJson(Map<String, dynamic> json) =>
      PageViewVarient(
        value: json['value'] as String?,
        unit: json['unit'] as String?,
        cost: json['cost'] as double?,
        price: json['price'] as double?,
        offerPrice: json['offerPrice'] as double?,
        primePrice: json['primePrice'] as double?,
        stock: json['stock'] as double?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
        'cost': cost,
        'price': price,
        'offerPrice': offerPrice,
        'primePrice': primePrice,
        'stock': stock,
        '_id': id,
      };
}
