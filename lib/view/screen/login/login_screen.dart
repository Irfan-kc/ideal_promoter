import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home/home.dart';
import 'package:ideal_promoter/view/screen/signup/signup_screen.dart';
import 'package:ideal_promoter/view/screen/login/widget/login_input_forms.dart';
import 'package:ideal_promoter/view/screen/login/widget/login_image.dart';
import 'package:ideal_promoter/view/widget/button/two_text_line.dart';
import 'package:ideal_promoter/view/widget/button/medium_button.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageWidget(),
            const KHeight(16),
            const Text(
              'Welcome back \n to ideal e shope',
              textAlign: TextAlign.center,
              style: AppTextStyle.h2,
            ),
            const KHeight(32),
            LoginInputForm(),
            const KHeight(8),
            TwoTextWidget(
              labelText: 'Forgot password? ',
              actionText: 'Reset password',
              onTap: () {},
            ),
            const KHeight(24),
            MediumButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Home(),
                  ),
                );
              },
              label: 'Login',
            ),
            const KHeight(12),
            TwoTextWidget(
              labelText: "Don’t have an account? ",
              actionText: 'Signup',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
