import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../../constant/text_style.dart';
import '../../../widget/button/medium_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../login_page/widget/two_text_line.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => SignUpPageProvider(),
      child: Consumer<SignUpPageProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Spacer(),

                  // const KHeight(16),
                  const Text(
                    "Do you wants to be\nan ideal business \npromoter? 😃",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h2,
                  ),
                  const Spacer(),
                  const Spacer(),
                  CustomTextField(
                    value: '',
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'Full Name',
                    focusNode: provider.nameFocus,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(provider.emailFocus);
                    },
                    onTap: () {
                      provider.onRefresh();
                    },
                    prefix: Image.asset(
                      'assets/icons/profile.png',
                      height: 14,
                      width: 14,
                    ),
                  ),
                  const Spacer(),
                  CustomTextField(
                      value: '',
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Eamil',
                      focusNode: provider.emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(provider.numberFocus);
                        provider.onRefresh();
                      },
                      onTap: () {
                        provider.onRefresh();
                      },
                      prefix: Image.asset(
                        'assets/icons/sms.png',
                        height: 14,
                        width: 14,
                      )),
                  const Spacer(),
                  CustomTextField(
                    value: '',
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'WhatsApp number',
                    focusNode: provider.numberFocus,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(provider.passwordFocus);
                      provider.onRefresh();
                    },
                    onTap: () {
                      provider.onRefresh();
                    },
                    // prefixText:
                    // numberFocus.hasFocus ? provider.countryCode : null,
                    prefix: provider.numberFocus.hasFocus
                        ? SizedBox(
                            width: 40,
                            child: Center(child: Text(provider.countryCode)))
                        : Image.asset(
                            'assets/icons/call-calling.png',
                            height: 14,
                            width: 14,
                          ),
                    suffix: CountryCodePicker(
                      enabled: true,
                      onChanged: (c) {
                        provider.countryCode = c.dialCode.toString();
                        provider.onRefresh();
                      },
                      initialSelection: 'IN',
                      favorite: const ['+91'],
                      showCountryOnly: false,
                      hideMainText: true,
                    ),
                  ),

                  const Spacer(),
                  CustomTextField(
                      value: '',
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'Password',
                      focusNode: provider.passwordFocus,
                      isPassword: true,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(provider.confirmFocus);
                      },
                      onTap: () {
                        provider.onRefresh();
                      },
                      prefix: Image.asset(
                        'assets/icons/key-square.png',
                        height: 14,
                        width: 14,
                      )),
                  const Spacer(),
                  CustomTextField(
                      value: '',
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      hintText: 'confirm Password',
                      focusNode: provider.confirmFocus,
                      isPassword: true,
                      prefix: Image.asset(
                        'assets/icons/key-square.png',
                        height: 14,
                        width: 14,
                      )),

                  const Spacer(),
                  const Spacer(),
                  MediumButton(
                    onTap: () {},
                    text: 'Sign up',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TwoTextWidget(
                        firstText: "Already have an account? ",
                        scndText: 'Login',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
