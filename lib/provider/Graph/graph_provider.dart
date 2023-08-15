import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Graph/graph_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/graph_service.dart';
import 'package:provider/provider.dart';

class GraphProvider extends BaseProvider {
  GraphModel? earningsGraphData;
  GraphModel? bvGraphData;

  bool isLoading = false;

  Future getEarningsGraphData(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<GraphService>(context, listen: false)
          .getEarningsGraphData();
      if (response.isSuccessful) {
        earningsGraphData = GraphModel.fromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getBusinessVolumeGraphData(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<GraphService>(context, listen: false)
          .getBusinessVolumeGraphData();
      if (response.isSuccessful) {
        bvGraphData = GraphModel.fromJson(response.body);
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
