class Order {
  String? id;
  String? orderId;
  String? orderStatus;

  Order({
    this.id,
    this.orderId,
    this.orderStatus,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      orderId: json['orderId'],
      orderStatus: json['orderStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'orderId': orderId,
      'orderStatus': orderStatus,
    };
  }
}
