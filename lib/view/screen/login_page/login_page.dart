import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
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
            const Expanded(
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
              focusNode: emailFocusNode,
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'Email id',
              prefixIcon: CupertinoIcons.person,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            const KHeight(16),
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'Password',
              prefixIcon: CupertinoIcons.lock,
              isPassword: true,
              focusNode: passwordFocusNode,
            ),
            const KHeight(32),
            MediumButton(
              onTap: () {},
              text: 'Login',
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            ),
            const KHeight(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot password? ',
                  style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Reset password',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
