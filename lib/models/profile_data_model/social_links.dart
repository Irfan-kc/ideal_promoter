class SocialLinks {
  String? facebookAccount;
  String? facebookPage;
  String? instagram;

  SocialLinks({this.facebookAccount, this.facebookPage, this.instagram});

  factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        facebookAccount: json['facebookAccount'] as String?,
        facebookPage: json['facebookPage'] as String?,
        instagram: json['instagram'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'facebookAccount': facebookAccount,
        'facebookPage': facebookPage,
        'instagram': instagram,
      };
}
