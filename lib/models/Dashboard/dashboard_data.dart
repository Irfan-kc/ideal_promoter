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
        totalPageViewsCount: double.parse(json["totalPageViewsCount"].toString()),
        todayPageViewsCount: double.parse(json["todayPageViewsCount"].toString()),
        totalEarningsCount: double.parse(json["totalEarningsCount"].toString()),
        todayEarningsCount: double.parse(json["todayEarningsCount"].toString()),
        totalEarningsAmount: double.parse(json["totalEarningsAmount"].toString()),
        todayEarningsAmount: double.parse(json["todayEarningsAmount"].toString()),
        totalBusinessVolumeCount:
            double.parse(json["totalBusinessVolumeCount"].toString()),
        todayBusinessVolumeCount:
            double.parse(json["todayBusinessVolumeCount"].toString()),
        totalBusinessVolumeAmount:
            double.parse(json["totalBusinessVolumeAmount"].toString()),
        todayBusinessVolumeAmount:
            double.parse(json["todayBusinessVolumeAmount"].toString()),
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
