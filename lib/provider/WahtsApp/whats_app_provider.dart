import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/whats_app_service.dart';
import 'package:provider/provider.dart';

class WhatsAppProvider extends BaseProvider {
  bool isLoading = false;

  Future getItOnWhatsApp(BuildContext context, String productId) async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await Provider.of<WhatsAppService>(context, listen: false)
          .getItOnWhatsApp(id: productId);
      if (response.isSuccessful) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successfully Send")));
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
