class GraphModel {
  double? jan;
  double? feb;
  double? march;
  double? april;
  double? may;
  double? jun;
  double? july;
  double? aug;
  double? sep;
  double? oct;
  double? nov;
  double? dec;

  GraphModel({
    this.jan = 0,
    this.feb = 0,
    this.march = 0,
    this.april = 0,
    this.may = 0,
    this.jun = 0,
    this.july = 0,
    this.aug = 0,
    this.sep = 0,
    this.oct = 0,
    this.nov = 0,
    this.dec = 0,
  });

  factory GraphModel.fromJson(Map<String, dynamic> json) {
    return GraphModel(
      jan: json['1'] ?? 0,
      feb: json['2'] ?? 0,
      march: json['3'] ?? 0,
      april: json['4'] ?? 0,
      may: json['5'] ?? 0,
      jun: json['6'] ?? 0,
      july: json['7'] ?? 0,
      aug: json['8'] ?? 0,
      sep: json['9'] ?? 0,
      oct: json['10'] ?? 0,
      nov: json['11'] ?? 0,
      dec: json['12'] ?? 0,
    );
  }
}
