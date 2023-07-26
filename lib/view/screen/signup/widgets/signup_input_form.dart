import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignupInputForm extends StatelessWidget {
  const SignupInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpPageProvider>(
      builder: (context, signUpPageProvider, _) {
        return Column(
          children: [
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'Full Name',
              focusNode: signUpPageProvider.nameFocus,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(signUpPageProvider.emailFocus);
              },
              onTap: () {
                signUpPageProvider.onRefresh();
              },
              prefix: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                  ),
                ),
              ),
            ),
            const KHeight(20),
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'Email',
              focusNode: signUpPageProvider.emailFocus,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(signUpPageProvider.numberFocus);
                signUpPageProvider.onRefresh();
              },
              onTap: () {
                signUpPageProvider.onRefresh();
              },
              prefix: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/sms.svg',
                  ),
                ),
              ),
            ),
            const KHeight(20),
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'WhatsApp number',
              maxLength: 10,
              focusNode: signUpPageProvider.numberFocus,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(signUpPageProvider.passwordFocus);
                signUpPageProvider.onRefresh();
              },
              onTap: () {
                signUpPageProvider.onRefresh();
              },
              prefix: signUpPageProvider.numberFocus.hasFocus
                  ? SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(signUpPageProvider.countryCode),
                      ),
                    )
                  : SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/call-calling.svg',
                        ),
                      ),
                    ),
              suffix: CountryCodePicker(
                enabled: true,
                onChanged: (c) {
                  signUpPageProvider.countryCode = c.dialCode.toString();
                  signUpPageProvider.onRefresh();
                },
                initialSelection: 'IN',
                favorite: const ['+91'],
                showCountryOnly: false,
                hideMainText: true,
              ),
            ),
            const KHeight(20),
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'Password',
              focusNode: signUpPageProvider.passwordFocus,
              isPassword: true,
              onFieldSubmitted: (value) {
                FocusScope.of(context)
                    .requestFocus(signUpPageProvider.confirmFocus);
              },
              onTap: () {
                signUpPageProvider.onRefresh();
              },
              prefix: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/key-square.svg',
                  ),
                ),
              ),
            ),
            const KHeight(20),
            CustomTextField(
              padding: const EdgeInsets.only(left: 20, right: 20),
              hintText: 'confirm Password',
              focusNode: signUpPageProvider.confirmFocus,
              isPassword: true,
              prefix: SizedBox(
                width: 50,
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
      },
    );
  }
}
