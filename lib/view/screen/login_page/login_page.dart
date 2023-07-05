import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/button/medium_button.dart';
import 'package:ideal_promoter/view/widget/custom_textfield.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode email = FocusNode();
  final FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Image(
                    image: AssetImage('assets/images/stunning_3D_cartoon.png')),
              ),
              const KHeight(16),
              const Text(
                'Welcome back \n to ideal e shope',
                textAlign: TextAlign.center,
                style: AppTextStyle.h2,
              ),
              const KHeight(32),
              CustomTextField(
                focusNode: email,
                padding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Email id',
                prefixIcon: CupertinoIcons.person,
                keyboardType: TextInputType.emailAddress,
                onfieldSubmited: (value) {
                  FocusScope.of(context).requestFocus(password);
                },
              ),
              const KHeight(20),
              CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Password',
                prefixIcon: CupertinoIcons.lock,
                isPasword: true,
                focusNode: password,
              ),
              const KHeight(38),
              MediumButton(
                onTap: () {},
                text: 'Login',
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
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
