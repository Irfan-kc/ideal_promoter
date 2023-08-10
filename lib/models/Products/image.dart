class ProductImage {
  String? publicId;
  String? url;
  String? id;

  ProductImage({this.publicId, this.url, this.id});

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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
