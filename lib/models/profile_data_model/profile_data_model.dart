import 'social_links.dart';

class ProfileData {
  bool? isActive;
  String? id;
  String? user;
  String? name;
  String? phone;
  String? email;
  String? address;
  bool? isVerified;
  String? refId;
  int? promoterPercentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? countryCode;
  SocialLinks? socialLinks;

  ProfileData({
    this.isActive,
    this.id,
    this.user,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.isVerified,
    this.refId,
    this.promoterPercentage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.countryCode,
    this.socialLinks,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      isActive: json['isActive'] as bool?,
      id: json['_id'] as String?,
      user: json['user'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      isVerified: json['isVerified'] as bool?,
      refId: json['ref_id'] as String?,
      promoterPercentage: json['promoterPercentage'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      countryCode: json['countryCode'] as String?,
      socialLinks: json['socialLinks'] == null
          ? null
          : SocialLinks.fromJson(json['socialLinks'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'isActive': isActive,
        '_id': id,
        'user': user,
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'isVerified': isVerified,
        'ref_id': refId,
        'promoterPercentage': promoterPercentage,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'countryCode': countryCode,
        'socialLinks': socialLinks?.toJson(),
      };
}
