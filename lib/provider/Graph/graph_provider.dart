import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/Graph/graph_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/graph_service.dart';
import 'package:provider/provider.dart';

class GraphProvider extends BaseProvider {
  GraphModel? graphData;
  bool isLoading = false;

  Future getGraphData(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<GraphService>(context, listen: false)
          .getAllraphData();
      if (response.isSuccessful) {
        graphData = GraphModel.fromJson(response.body);
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
