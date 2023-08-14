import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/BusinessVolume/business_volume.dart';
import 'package:ideal_promoter/models/BusinessVolume/business_volume_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/business_volume_service.dart';
import 'package:provider/provider.dart';

class BusinessVolumeProvider extends BaseProvider {
  bool isLoading = false;
  List<BusinessVolume> businessVolumeData = [];

  Future getAllBusinessVolume(
    BuildContext context, {
    String? fromDate,
    String? toDate,
    int? page,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<BusinessVolumeService>(context,
              listen: false)
          .getBusinessVolume(fromDate: fromDate, toDate: toDate, page: page);
      if (response.isSuccessful) {
        var result = BusinessVolumeModel.fromJson(response.body);
        businessVolumeData = result.businessVolumes ?? [];
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
