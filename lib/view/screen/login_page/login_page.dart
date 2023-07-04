import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/view/widget/custom_textfield.dart';
import 'package:ideal_promoter/view/widget/height_and_width.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 85, 20, 80),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/stunning_3D_cartoon.png')),
            ConstHeight(16),
            Text(
              'Welcome back \n to ideal e shope',
              textAlign: TextAlign.center,
              style: AppTextStyle.h2,
            ),
            ConstHeight(32),
            CustomTextField(
              hintText: 'Email id',
              prefixIcon: CupertinoIcons.person,
              keyboardType: TextInputType.emailAddress,
            ),
            ConstHeight(20),
            CustomTextField(
              hintText: 'Password',
              prefixIcon: CupertinoIcons.lock,
            ),
          ],
        ),
      ),
    );
  }
}
