import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Earnings/earnings.dart';
import 'package:ideal_promoter/models/Earnings/earnings_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/earnings_service.dart';
import 'package:provider/provider.dart';

class EarningsProvider extends BaseProvider {
  bool isLoading = false;
  List<Earnings> earningsData = [];

  Future getAllEarnings(
    BuildContext context, {
    String? fromDate,
    String? toDate,
    int? page,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<EarningsService>(context,
              listen: false)
          .earningsData(fromDate: fromDate, toDate: toDate, page: page);
      if (response.isSuccessful) {
        var result = EarningsModel.fromJson(response.body);
        earningsData = result.earnings ?? [];
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
