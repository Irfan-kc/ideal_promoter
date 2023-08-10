class SingleProductImage {
  String? publicId;
  String? url;
  String? id;

  SingleProductImage({this.publicId, this.url, this.id});

  factory SingleProductImage.fromJson(Map<String, dynamic> json) => SingleProductImage(
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
