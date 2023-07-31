import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/dashboard_data.dart';
import 'package:ideal_promoter/services/dashboard_service.dart';
import 'package:provider/provider.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardData? dashboardData;
  bool dataNotGet = false;

  bool isLoading = false;

  DashboardProvider() {
    onRefresh();
  }

  Future getDashboardData(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<DashboardService>(context, listen: false)
          .dashboardData();
      if (response.isSuccessful) {
        dataNotGet = false;
        dashboardData = DashboardData.fromJson(response.body);
        notifyListeners();
      } else {
        dataNotGet = true;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  onRefresh() {
    notifyListeners();
  }
}
