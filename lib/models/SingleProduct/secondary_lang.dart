class SecondaryLang {
  String? name;
  String? description;
  String? highlights;

  SecondaryLang({this.name, this.description, this.highlights});

  factory SecondaryLang.fromJson(Map<String, dynamic> json) => SecondaryLang(
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
