import 'logo_image.dart';
import 'main_category.dart';
import 'primary_lang.dart';
import 'secondary_lang.dart';

class CategoryModel {
  PrimaryLang? primaryLang;
  SecondaryLang? secondaryLang;
  String? id;
  List<LogoImage>? logoImages;
  List<dynamic>? bannerImages;
  bool? isMain;
  MainCategory? mainCategory;
  dynamic priority;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? phone;
  String? storeName;

  CategoryModel({
    this.primaryLang,
    this.secondaryLang,
    this.id,
    this.logoImages,
    this.bannerImages,
    this.isMain,
    this.mainCategory,
    this.priority,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phone,
    this.storeName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
        isMain: json['isMain'] as bool?,
        mainCategory: json['mainCategory'] == null
            ? null
            : MainCategory.fromJson(
                json['mainCategory'] as Map<String, dynamic>),
        priority: json['priority'] as dynamic,
        isActive: json['isActive'] as bool?,
        isDeleted: json['isDeleted'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        phone: json['phone'] as int?,
        storeName: json['storeName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'primaryLang': primaryLang?.toJson(),
        'secondaryLang': secondaryLang?.toJson(),
        '_id': id,
        'logoImages': logoImages?.map((e) => e.toJson()).toList(),
        'bannerImages': bannerImages,
        'isMain': isMain,
        'mainCategory': mainCategory?.toJson(),
        'priority': priority,
        'isActive': isActive,
        'isDeleted': isDeleted,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'phone': phone,
        'storeName': storeName,
      };
}
