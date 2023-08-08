class LogoImage {
  String? publicId;
  String? url;
  String? id;

  LogoImage({this.publicId, this.url, this.id});

  factory LogoImage.fromJson(Map<String, dynamic> json) => LogoImage(
        publicId: json['public_id'] as String?,
        url: json['url'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'public_id': publicId,
        'url': url,
        '_id': id,
      };
}
