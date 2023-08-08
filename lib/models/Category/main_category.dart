import 'logo_image.dart';
import 'primary_lang.dart';
import 'secondary_lang.dart';

class MainCategory {
  PrimaryLang? primaryLang;
  SecondaryLang? secondaryLang;
  String? id;
  List<LogoImage>? logoImages;
  List<dynamic>? bannerImages;

  MainCategory({
    this.primaryLang,
    this.secondaryLang,
    this.id,
    this.logoImages,
    this.bannerImages,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        primaryLang: json['primaryLang'] == null
            ? null
            : PrimaryLang.fromJson(json['primaryLang'] as Map<String, dynamic>),
        secondaryLang: json['secondaryLang'] == null
            ? null
            : SecondaryLang.fromJson(
                json['secondaryLang'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        logoImages: (json['logoImages'] as List<dynamic>?)
            ?.map((e) => LogoImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        bannerImages: json['bannerImages'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'primaryLang': primaryLang?.toJson(),
        'secondaryLang': secondaryLang?.toJson(),
        '_id': id,
        'logoImages': logoImages?.map((e) => e.toJson()).toList(),
        'bannerImages': bannerImages,
      };
}
