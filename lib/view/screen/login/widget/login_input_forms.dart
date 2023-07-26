import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';

class LoginInputForm extends StatelessWidget {
  LoginInputForm({super.key});

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          focusNode: emailFocusNode,
          padding: const EdgeInsets.only(left: 16, right: 16),
          hintText: 'Username',
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
          prefix: SizedBox(
            width: 70,
            height: 50,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
              ),
            ),
          ),
        ),
        const KHeight(16),
        CustomTextField(
          padding: const EdgeInsets.only(left: 16, right: 16),
          hintText: 'Password',
          isPassword: true,
          focusNode: passwordFocusNode,
          prefix: SizedBox(
            width: 70,
            height: 50,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/key-square.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
