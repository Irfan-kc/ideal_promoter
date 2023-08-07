import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginInputForm extends StatelessWidget {
  LoginInputForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            focusNode: emailFocusNode,
            padding: const EdgeInsets.only(left: 16, right: 16),
            hintText: 'Email ID',
            validator: (value) {
              if (value == null || value.isEmpty) return "Enter the username";
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).email = value;
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            prefix: SizedBox(
              width: 70,
              height: 50,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/sms.svg',
                ),
              ),
            ),
          ),
          const KHeight(16),
          CustomTextField(
            padding: const EdgeInsets.only(left: 16, right: 16),
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) return "Enter the password";
              return null;
            },
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).password =
                  value;
            },
            isPassword: true,
            controller: passwordController,
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
      ),
    );
  }
}
