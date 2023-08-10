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
        totalPageViewsCount: json['totalPageViewsCount'] as double?,
        totalEarningsCount: json['totalEarningsCount'] as double?,
        totalEarningsAmount: json['totalEarningsAmount'] as double?,
        todayPageViewsCount: json['todayPageViewsCount'] as double?,
        todayEarningsCount: json['todayEarningsCount'] as double?,
        totalBusinessVolumeCount: json['totalBusinessVolumeCount'] as double?,
        totalBusinessVolumeAmount: json['totalBusinessVolumeAmount'] as double?,
        todayBusinessVolumeCount: json['todayBusinessVolumeCount'] as double?,
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
