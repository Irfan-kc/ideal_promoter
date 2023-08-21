class Varient {
  String? value;
  String? unit;
  dynamic cost;
  dynamic price;
  dynamic offerPrice;
  dynamic primePrice;
  dynamic stock;
  String? id;

  Varient({
    this.value,
    this.unit,
    this.cost,
    this.price,
    this.offerPrice,
    this.primePrice,
    this.stock,
    this.id,
  });

  factory Varient.fromJson(Map<String, dynamic> json) => Varient(
        value: json['value'] as String?,
        unit: json['unit'] as String?,
        cost: json['cost'] as dynamic,
        price: json['price'] as dynamic,
        offerPrice: json['offerPrice'] as dynamic,
        primePrice: json['primePrice'] as dynamic,
        stock: json['stock'] as dynamic,
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
