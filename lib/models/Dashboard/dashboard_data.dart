class DashboardData {
  double? totalPageViewsCount;
  double? totalEarningsCount;
  double? totalEarningsAmount;
  double? todayPageViewsCount;
  double? todayEarningsCount;
  double? totalBusinessVolumeCount;
  double? totalBusinessVolumeAmount;
  double? todayBusinessVolumeCount;

  DashboardData({
    this.totalPageViewsCount,
    this.totalEarningsCount,
    this.totalEarningsAmount,
    this.todayPageViewsCount,
    this.todayEarningsCount,
    this.totalBusinessVolumeCount,
    this.totalBusinessVolumeAmount,
    this.todayBusinessVolumeCount,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        totalPageViewsCount:
            double.tryParse(json['totalPageViewsCount'].toString()),
        totalEarningsCount:
            double.tryParse(json['totalEarningsCount'].toString()),
        totalEarningsAmount:
            double.tryParse(json['totalEarningsAmount'].toString()),
        todayPageViewsCount:
            double.tryParse(json['todayPageViewsCount'].toString()),
        todayEarningsCount:
            double.tryParse(json['todayEarningsCount'].toString()),
        totalBusinessVolumeCount:
            double.tryParse(json['totalBusinessVolumeCount'].toString()),
        totalBusinessVolumeAmount:
            double.tryParse(json['totalBusinessVolumeAmount'].toString()),
        todayBusinessVolumeCount:
            double.tryParse(json['todayBusinessVolumeCount'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'totalPageViewsCount': totalPageViewsCount,
        'totalEarningsCount': totalEarningsCount,
        'totalEarningsAmount': totalEarningsAmount,
        'todayPageViewsCount': todayPageViewsCount,
        'todayEarningsCount': todayEarningsCount,
        'totalBusinessVolumeCount': totalBusinessVolumeCount,
        'totalBusinessVolumeAmount': totalBusinessVolumeAmount,
        'todayBusinessVolumeCount': todayBusinessVolumeCount,
      };
}
