import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/screen/login_page/login_page.dart';
import 'package:provider/provider.dart';

import '../../../../constant/text_style.dart';
import '../../../widget/button/medium_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/button/two_text_line.dart';

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
                    prefix: SizedBox(
                      // color: Colors.black,
                      width: 50,
                      height: 50,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/profile.svg',
                        ),
                      ),
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
                      FocusScope.of(context).requestFocus(provider.numberFocus);
                      provider.onRefresh();
                    },
                    onTap: () {
                      provider.onRefresh();
                    },
                    prefix: SizedBox(
                      // color: Colors.black,
                      width: 50,
                      height: 50,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/sms.svg',
                        ),
                      ),
                    ),
                  ),
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
                    prefix: provider.numberFocus.hasFocus
                        ? SizedBox(
                            width: 40,
                            child: Center(child: Text(provider.countryCode)))
                        : SizedBox(
                            // color: Colors.black,
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
                  const Spacer(),
                  CustomTextField(
                    value: '',
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'confirm Password',
                    focusNode: provider.confirmFocus,
                    isPassword: true,
                    prefix: SizedBox(
                      // color: Colors.black,
                      width: 50,
                      height: 50,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/key-square.svg',
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  MediumButton(
                    onTap: () {},
                    label: 'Sign up',
                  ),
                  const Spacer(),
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
