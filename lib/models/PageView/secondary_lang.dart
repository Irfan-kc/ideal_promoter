class PageViewSecondaryLang {
  String? name;

  PageViewSecondaryLang({this.name});

  factory PageViewSecondaryLang.fromJson(Map<String, dynamic> json) => PageViewSecondaryLang(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
