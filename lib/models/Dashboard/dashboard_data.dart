class DashboardData {
  double? totalPageViewsCount;
  double? todayPageViewsCount;
  double? totalEarningsCount;
  double? todayEarningsCount;
  double? totalEarningsAmount;
  double? todayEarningsAmount;
  double? totalBusinessVolumeCount;
  double? todayBusinessVolumeCount;
  double? totalBusinessVolumeAmount;
  double? todayBusinessVolumeAmount;

  DashboardData({
    this.totalPageViewsCount,
    this.todayPageViewsCount,
    this.totalEarningsCount,
    this.todayEarningsCount,
    this.totalEarningsAmount,
    this.todayEarningsAmount,
    this.totalBusinessVolumeCount,
    this.todayBusinessVolumeCount,
    this.totalBusinessVolumeAmount,
    this.todayBusinessVolumeAmount,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        totalPageViewsCount: double.parse(["totalPageViewsCount"].toString()),
        todayPageViewsCount: double.parse(["todayPageViewsCount"].toString()),
        totalEarningsCount: double.parse(["totalEarningsCount"].toString()),
        todayEarningsCount: double.parse(["todayEarningsCount"].toString()),
        totalEarningsAmount: double.parse(["totalEarningsAmount"].toString()),
        todayEarningsAmount: double.parse(["todayEarningsAmount"].toString()),
        totalBusinessVolumeCount:
            double.parse(["totalBusinessVolumeCount"].toString()),
        todayBusinessVolumeCount:
            double.parse(["todayBusinessVolumeCount"].toString()),
        totalBusinessVolumeAmount:
            double.parse(["totalBusinessVolumeAmount"].toString()),
        todayBusinessVolumeAmount:
            double.parse(["todayBusinessVolumeAmount"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "totalPageViewsCount": totalPageViewsCount,
        "todayPageViewsCount": todayPageViewsCount,
        "totalEarningsCount": totalEarningsCount,
        "todayEarningsCount": todayEarningsCount,
        "totalEarningsAmount": totalEarningsAmount,
        "todayEarningsAmount": todayEarningsAmount,
        "totalBusinessVolumeCount": totalBusinessVolumeCount,
        "todayBusinessVolumeCount": todayBusinessVolumeCount,
        "totalBusinessVolumeAmount": totalBusinessVolumeAmount,
        "todayBusinessVolumeAmount": todayBusinessVolumeAmount,
      };
}
