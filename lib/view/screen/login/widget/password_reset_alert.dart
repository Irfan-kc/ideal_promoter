import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/view/widget/buttons/medium_button.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../constant/const_color.dart';

class PasswordResetAlert extends StatelessWidget {
  const PasswordResetAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      titleTextStyle: AppTextStyle.alertHead,
      scrollable: true,
      title: const Text('Password Reset'),
      content: Column(
        children: [
          const Text(
            'Enter the email address associated with your account. We will send a password reset link to this email',
            style: AppTextStyle.body3Text,
          ),
          const KHeight(16),
          CustomTextField(
            hintText: 'Email',
            controller: email,
            keyboardType: TextInputType.emailAddress,
            prefix: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                ),
              ),
            ),
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
                isLoading:
                    Provider.of<AuthProvider>(context, listen: false).isLoading,
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .reset(context, email.text);
                },
                label: 'Reset',
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
