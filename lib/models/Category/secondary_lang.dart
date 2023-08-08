class SecondaryLang {
  String? name;
  String? description;

  SecondaryLang({this.name, this.description});

  factory SecondaryLang.fromJson(Map<String, dynamic> json) => SecondaryLang(
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
