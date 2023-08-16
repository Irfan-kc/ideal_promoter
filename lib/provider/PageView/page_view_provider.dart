import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/PageView/page_view.dart';
import 'package:ideal_promoter/models/PageView/page_view_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/page_views_service.dart';
import 'package:provider/provider.dart';

class PageViewProvider extends BaseProvider {
  bool isLoading = false;
  List<PageViews> pageViewData = [];

  Future getAllPageViews(
    BuildContext context, {
    String? fromDate,
    String? toDate,
    int? page,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      if (page == null || page == 1) {
        pageViewData.clear();
      }
      var response = await Provider.of<PageViewService>(context, listen: false)
          .pageViewData(page: page);
      if (response.isSuccessful) {
        var result = PageViewModel.fromJson(response.body);
        pageViewData.addAll(result.pageViews ?? []);
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
