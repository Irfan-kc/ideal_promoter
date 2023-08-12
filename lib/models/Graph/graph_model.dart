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
      jan: double.tryParse((json['1'] ?? 0).toString()),
      feb: double.tryParse((json['2'] ?? 0).toString()),
      march: double.tryParse((json['3'] ?? 0).toString()),
      april: double.tryParse((json['4'] ?? 0).toString()),
      may: double.tryParse((json['5'] ?? 0).toString()),
      jun: double.tryParse((json['6'] ?? 0).toString()),
      july: double.tryParse((json['7'] ?? 0).toString()),
      aug: double.tryParse((json['8'] ?? 0).toString()),
      sep: double.tryParse((json['9'] ?? 0).toString()),
      oct: double.tryParse((json['10'] ?? 0).toString()),
      nov: double.tryParse((json['11'] ?? 0).toString()),
      dec: double.tryParse((json['12'] ?? 0).toString()),
    );
  }
}
