class PageViewImage {
  String? publicId;
  String? url;
  String? id;

  PageViewImage({this.publicId, this.url, this.id});

  factory PageViewImage.fromJson(Map<String, dynamic> json) => PageViewImage(
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
