import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/buttons/medium_button.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

import '../../../../../../constant/const_color.dart';
import '../../../../../../provider/Authentication/auth_provider.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      // contentPadding: EdgeInsets.all(),
      titleTextStyle: AppTextStyle.alertHead,
      scrollable: true,
      title: const Text('Confirm Logout'),
      content: Column(
        children: [
          const Text(
            'Are you sure you want to log out?',
            style: AppTextStyle.body3Text,
          ),
          const KHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MediumButton(
                onTap: () {
                  Navigator.pop(context);
                },
                label: 'Cancel',
                width: 100,
                height: 40,
                color: Colors.white,
                textStyle: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const KWidth(8),
              MediumButton(
                color: Colors.red,
                isLoading:
                    Provider.of<AuthProvider>(context, listen: false).isLoading,
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .logout(context);
                },
                label: 'Logout',
                width: 100,
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
