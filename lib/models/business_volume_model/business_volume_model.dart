import 'business_volume.dart';

class BusinessVolumeModel {
  List<BusinessVolume>? businessVolumes;
  double? totalBusinessVolumesAmount;
  int? total;

  BusinessVolumeModel({
    this.businessVolumes,
    this.totalBusinessVolumesAmount,
    this.total,
  });

  factory BusinessVolumeModel.fromJson(Map<String, dynamic> json) {
    return BusinessVolumeModel(
      businessVolumes: (json['businessVolumes'] as List<dynamic>?)
          ?.map((e) => BusinessVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBusinessVolumesAmount:
          (json['totalBusinessVolumesAmount'] as num?)?.toDouble(),
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'businessVolumes': businessVolumes?.map((e) => e.toJson()).toList(),
        'totalBusinessVolumesAmount': totalBusinessVolumesAmount,
        'total': total,
      };
}
