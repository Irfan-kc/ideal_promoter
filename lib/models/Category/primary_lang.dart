class PrimaryLang {
  String? name;
  String? description;

  PrimaryLang({this.name, this.description});

  factory PrimaryLang.fromJson(Map<String, dynamic> json) => PrimaryLang(
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
