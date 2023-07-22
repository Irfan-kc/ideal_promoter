import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/home_screen.dart';
import 'package:ideal_promoter/view/screen/home/home.dart';
import 'package:ideal_promoter/view/screen/home/sign_up_page/sign_up_page.dart';
import 'package:ideal_promoter/view/screen/login_page/widget/two_text_line.dart';
import 'package:ideal_promoter/view/widget/button/medium_button.dart';
import 'package:ideal_promoter/view/widget/custom_textfield.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const KHeight(36),
            const Flexible(
              fit: FlexFit.tight,
              child: Image(
                image: AssetImage('assets/images/stunning_3D_cartoon.png'),
              ),
            ),
            const KHeight(16),
            const Text(
              'Welcome back \n to ideal e shope',
              textAlign: TextAlign.center,
              style: AppTextStyle.h2,
            ),
            const KHeight(32),
            CustomTextField(
                value: '',
                focusNode: emailFocusNode,
                padding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Username',
                // prefixIcon: CupertinoIcons.person,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                prefix: Image.asset(
                  'assets/icons/profile.png',
                  height: 14,
                  width: 14,
                )),
            const KHeight(16),
            CustomTextField(
                value: '',
                padding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Password',
                // prefixIcon: CupertinoIcons.lock,
                isPassword: true,
                focusNode: passwordFocusNode,
                prefix: Image.asset(
                  'assets/icons/key-square.png',
                  height: 14,
                  width: 14,
                )),
            const KHeight(8),
            TwoTextWidget(
              firstText: 'Forgot password? ',
              scndText: 'Reset password',
              onTap: () {},
            ),
            const KHeight(24),
            MediumButton(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Home()));
              },
              text: 'Login',
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            ),
            const KHeight(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TwoTextWidget(
                  firstText: "Don’t have an account? ",
                  scndText: 'Signup',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
