class Promoter {
  String? id;
  String? name;
  String? phone;

  Promoter({this.id, this.name, this.phone});

  factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'phone': phone,
      };
}
