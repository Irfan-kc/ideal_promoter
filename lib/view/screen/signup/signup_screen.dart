import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/screen/login/login_screen.dart';
import 'package:ideal_promoter/view/screen/signup/widgets/signup_input_form.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';
import 'package:provider/provider.dart';

import '../../../constant/text_style.dart';
import '../../widget/button/medium_button.dart';
import '../../widget/button/two_text_line.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<SignUpPageProvider>(builder: (context, provider, _) {
      return SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do you wants to be\nan ideal business \npromoter? 😃",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h2,
                ),
                const KHeight(40),
                const SignupInputForm(),
                const KHeight(40),
                MediumButton(
                  onTap: () {},
                  label: 'Sign up',
                ),
                const KHeight(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TwoTextWidget(
                      labelText: "Already have an account? ",
                      actionText: 'Login',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
