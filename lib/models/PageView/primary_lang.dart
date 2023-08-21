class PageViewPrimaryLang {
  String? name;

  PageViewPrimaryLang({this.name});

  factory PageViewPrimaryLang.fromJson(Map<String, dynamic> json) => PageViewPrimaryLang(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
