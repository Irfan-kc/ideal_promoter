class PrimaryLang {
  String? name;
  String? description;
  String? highlights;

  PrimaryLang({this.name, this.description, this.highlights});

  factory PrimaryLang.fromJson(Map<String, dynamic> json) => PrimaryLang(
        name: json['name'] as String?,
        description: json['description'] as String?,
        highlights: json['highlights'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'highlights': highlights,
      };
}
