import 'package:flutter/material.dart';
import 'package:ideal_promoter/View/screen/login/widget/login_image.dart';
import 'package:ideal_promoter/View/screen/signup/signup_screen.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/view/screen/login/widget/login_input_forms.dart';
import 'package:ideal_promoter/view/widget/buttons/medium_button.dart';
import 'package:ideal_promoter/view/widget/buttons/two_text_line.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email =
        TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            LoginInputForm(
              formKey: formKey,
              emailController: email,
              passwordController: password,
            ),
            const KHeight(8),
            TwoTextWidget(
              labelText: 'Forgot password? ',
              actionText: 'Reset password',
              onTap: () {},
            ),
            const KHeight(24),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                return MediumButton(
                  isLoading: authProvider.isLoading,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await Provider.of<AuthProvider>(context, listen: false)
                          .login(
                        context,
                        email.text,
                        password.text,
                      );
                    }
                  },
                  label: 'Login',
                );
              },
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
