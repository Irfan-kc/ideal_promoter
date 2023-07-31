class DashboardData {
  int? totalPageViewsCount;
  int? totalEarningsCount;
  int? totalEarningsAmount;
  int? todayPageViewsCount;
  int? todayEarningsCount;
  int? totalBusinessVolumeCount;
  int? totalBusinessVolumeAmount;
  int? todayBusinessVolumeCount;

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
        totalPageViewsCount: json['totalPageViewsCount'] as int?,
        totalEarningsCount: json['totalEarningsCount'] as int?,
        totalEarningsAmount: json['totalEarningsAmount'] as int?,
        todayPageViewsCount: json['todayPageViewsCount'] as int?,
        todayEarningsCount: json['todayEarningsCount'] as int?,
        totalBusinessVolumeCount: json['totalBusinessVolumeCount'] as int?,
        totalBusinessVolumeAmount: json['totalBusinessVolumeAmount'] as int?,
        todayBusinessVolumeCount: json['todayBusinessVolumeCount'] as int?,
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
