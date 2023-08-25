import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/Authentication/auth_provider.dart';
import 'package:ideal_promoter/view/screen/login/login_screen.dart';
import 'package:ideal_promoter/view/screen/signup/widgets/signup_input_form.dart';
import 'package:ideal_promoter/view/widget/buttons/medium_button.dart';
import 'package:ideal_promoter/view/widget/buttons/two_text_line.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Do you wants to be\nan ideal business \npromoter? 😃",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h2,
                  ),
                  const KHeight(40),
                  SignupInputForm(
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    numberController: numberController,
                    passwordController: passwordController,
                    confirmController: confirmController,
                  ),
                  const KHeight(40),
                  MediumButton(
                    isLoading: provider.isLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signup(
                          context,
                          nameController.text,
                          numberController.text,
                          emailController.text,
                          passwordController.text,
                          confirmController.text,
                        );
                      }
                    },
                    label: 'Sign up',
                  ),
                  const KHeight(16),
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
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
