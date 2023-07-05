import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/button/login_button.dart';
import 'package:ideal_promoter/view/widget/custom_textfield.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                  image: AssetImage('assets/images/stunning_3D_cartoon.png')),
              const ConstHeight(16),
              const Text(
                'Welcome back \n to ideal e shope',
                textAlign: TextAlign.center,
                style: AppTextStyle.h2,
              ),
              const ConstHeight(32),
              const CustomTextField(
                hintText: 'Email id',
                prefixIcon: CupertinoIcons.person,
                keyboardType: TextInputType.emailAddress,
              ),
              const ConstHeight(20),
              const CustomTextField(
                hintText: 'Password',
                prefixIcon: CupertinoIcons.lock,
              ),
              const ConstHeight(38),
              LoginButton(
                onTap: () {},
                text: 'Login',
                padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              ),
              const ConstHeight(16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password? ',
                    style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 13,
                        letterSpacing: 0.65,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Reset password',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                        letterSpacing: 0.65,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
