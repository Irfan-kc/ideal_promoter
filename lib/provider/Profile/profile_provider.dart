import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ideal_promoter/models/profile_data_model/profile_data_model.dart';
import 'package:ideal_promoter/provider/base_provider.dart';
import 'package:ideal_promoter/services/profile_service.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends BaseProvider {
  bool isLoading = false;
  bool isUpdating = false;
  ProfileData? profileData;

  Future getProfileData(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Provider.of<ProfileService>(context, listen: false)
          .getProfile();
      if (response.isSuccessful) {
        profileData = ProfileData.fromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future updateProfile(BuildContext context, ProfileData profileData) async {
    try {
      isUpdating = true;
      notifyListeners();
      var response = await Provider.of<ProfileService>(context, listen: false)
          .updateProfile(
        body: profileData.toJson(),
      );
      if (response.isSuccessful) {
        profileData = ProfileData.fromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }
}
