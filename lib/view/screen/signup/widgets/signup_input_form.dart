import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/provider/signup_page/signup_page_provider.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:ideal_promoter/view/widget/textfields/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignupInputForm extends StatelessWidget {

final  TextEditingController nameController;
final TextEditingController emailController;
final TextEditingController numberController;
final TextEditingController passwordController;
final TextEditingController confirmController;

final FocusNode nameFocus = FocusNode();
final FocusNode emailFocus = FocusNode();
final FocusNode numberFocus = FocusNode();
final FocusNode passwordFocus = FocusNode();
final FocusNode confirmFocus = FocusNode();

   SignupInputForm({super.key, required this.nameController, required this.emailController, required this.numberController, required this.passwordController, required this.confirmController});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpPageProvider(),
      child: Builder(
        builder: (context) {
          return Column(
                children: [
                  CustomTextField(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    hintText: 'Full Name',
                    focusNode:nameFocus,
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(emailFocus);
                    },
                    onTap: () {
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
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
                    focusNode: emailFocus,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(numberFocus);
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
                    },
                    onTap: () {
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
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
                    focusNode: numberFocus,
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(passwordFocus);
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
                    },
                    onTap: () {
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
                    },
                    prefix: numberFocus.hasFocus
                        ? SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(Provider.of<SignUpPageProvider>(context,listen: false).country),
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
                        Provider.of<SignUpPageProvider>(context,listen: false).country = c.dialCode.toString();
                        Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
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
                    controller: passwordController,
                    focusNode: passwordFocus,
                    isPassword: true,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(confirmFocus);
                    },
                    onTap: () {
                      Provider.of<SignUpPageProvider>(context,listen: false).onRefresh();
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
                    focusNode: confirmFocus,
                    controller: confirmController,
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
        }
      )
    );
  }
}
